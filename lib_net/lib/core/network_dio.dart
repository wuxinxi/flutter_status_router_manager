import 'package:dio/dio.dart';
import 'package:lib_net/core/network_config.dart';

import '../data/base_response.dart';
import '../interceptor/log_interceptor.dart';
import 'network_method.dart';

class FHttp {
  static const int _connectTimeout = 30 * 1000;
  static const int _receiveTimeout = 30 * 1000;
  static const int _sendTimeout = 30 * 1000;

  late Dio _dio;

  static final FHttp _instance = FHttp._();

  FHttp._() {
    BaseOptions options = _createBaseOption();
    _dio = Dio(options);
    _dio.interceptors.add(LoggerInterceptor());
    // _dio.interceptors.add(CommonHeaderInterceptor());
    // _dio.interceptors.add(AppAuthorizationHeaderInterceptor());
    // _dio.interceptors.add(EncryptHeaderInterceptor());
  }

  static FHttp getInstance() {
    return _instance;
  }

  void addInterceptor(Interceptor interceptor) {
    _dio.interceptors.add(interceptor);
  }

  void addInterceptors(List<Interceptor> interceptors) {
    _dio.interceptors.addAll(interceptors);
  }

  BaseOptions _createBaseOption() {
    return BaseOptions(
        baseUrl: AppNetConfig.getInstance().getConfig().getBaseUrl(),
        connectTimeout: _connectTimeout,
        receiveTimeout: _receiveTimeout,
        sendTimeout: _sendTimeout);
  }

  final _methodValues = {
    Method.get: Method.get.name,
    Method.post: Method.post.name,
    Method.put: Method.put.name,
    Method.delete: Method.delete.name,
    Method.patch: Method.patch.name,
    Method.head: Method.head.name
  };

  Future<T> request<T extends BaseResponse>(
    T responseEntity,
    String path, {
    Method method = Method.get,
    Map<String, dynamic>? params,
    data,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    Function(T t)? onSuccess,
    Function(int code, String msg)? onFailed,
  }) async {
    options ??= Options(method: _methodValues[method]);
    try {
      Response response;
      response = await _dio.request(path,
          data: data,
          queryParameters: params,
          cancelToken: cancelToken,
          options: options,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
      Map map = response.data;

      responseEntity.parse(map);
      if (responseEntity.code == 0) {
        onSuccess?.call(responseEntity.data);
      } else {
        onFailed?.call(responseEntity.code, responseEntity.message);
      }
      return responseEntity;
    } catch (e) {
      onFailed?.call(
          responseEntity.code = -1, responseEntity.message = 'error');
      return responseEntity;
    }
  }
}

final Network = FHttp.getInstance();
