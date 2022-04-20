import 'dart:developer';

import 'package:dio/dio.dart';

///
/// @date: 2022/4/15 09:27
/// @author: Sensi
/// @remark:
///
class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('request method=${options.method}');
    log('request path=${options.path}');

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('response code=${response.statusCode}');
    // log('response data=${response.data.toString()}');
    handler.next(response);
  }
}
