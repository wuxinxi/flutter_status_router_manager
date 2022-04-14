import 'dart:math';

import 'package:dio/dio.dart';

///
/// @date: 2022/3/26 15:41
/// @author: Sensi
/// @remark:common request header
///

class CommonHeaderInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept-Language'] = 'en-US';
    options.headers['Content-Type'] = 'application/json';
    options.headers['X-Request-ID'] =
        '${DateTime.now().toIso8601String()}${Random().nextInt(999999999)}';
    options.headers['x-api-key'] = 'OQpKYNCE1oCfZu0Kqn8v8VqgfLH8K83h';
    options.headers['Device-Type'] = 'CompanionApp';
    handler.next(options);
  }
}
