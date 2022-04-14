import 'package:dio/dio.dart';

///
/// @date: 2022/3/26 21:12
/// @author: Sensi
/// @remark:
///

class AppAuthorizationHeaderInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }
}
