import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';

import '../core/network_config.dart';

///
/// @date: 2022/3/26 21:28
/// @author: Sensi
/// @remark:
///

class TokenAuthenticatorInterceptor extends QueuedInterceptor {
  static const String refreshTokenUrl =
      'https://mc-api-uat.tecpal.com/api/token/refresh';

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == 401) {
      var success = await _refreshToken();
      if (success) {
        var requestOptions = response.requestOptions;
        requestOptions.headers['Authorization'] =
            AppNetConfig.getInstance().getConfig().getCurrentAccessToken();
        //re request
      }
    }
  }

  Future<bool> _refreshToken() async {
    HttpClient? client;
    bool success = false;
    try {
      client = HttpClient();
      HttpClientRequest request =
          await client.getUrl(Uri.parse(refreshTokenUrl));
      request.headers.add('Authorization',
          AppNetConfig.getInstance().getConfig().getCurrentAccessToken());
      request.headers.add('Content-Type', 'application/json');
      request.headers.add('X-Request-ID',
          '${DateTime.now().toIso8601String()}${Random().nextInt(999999)}');
      request.headers.add(
          'x-api-key', AppNetConfig.getInstance().getConfig().getXApiKey());

      HttpClientResponse response = await request.close();
      if (response.statusCode == 200) {
        var responseBody = await response.transform(utf8.decoder).join();
        const JsonDecoder decoder = JsonDecoder();
        var convert = decoder.convert(responseBody);
        String jwt = convert["jwt"];
        AppNetConfig.getInstance().getConfig().setCurrentAccessToken(jwt);
        AppNetConfig.getInstance()
            .getConfig()
            .setRefreshTokenTime(DateTime.now());
        success = true;
      }
    } catch (e) {
      try {
        client?.close();
      } catch (_) {}
    }
    return Future.value(success);
  }
}
