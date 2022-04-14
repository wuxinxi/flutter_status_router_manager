import 'package:dio/dio.dart';

///
/// @date: 2022/3/27 08:13
/// @author: Sensi
/// @remark:
///

abstract class NetConfig {
  String getCurrentAccessToken();

  void setCurrentAccessToken(String token);

  DateTime getLastRefreshTokenTime();

  void setRefreshTokenTime(DateTime time);

  String getEncryptPublicKey();

  String getXApiKey();

  String getAcceptLanguage();

  String getBaseUrl();

  List<Interceptor> interceptors();
}

class AppNetConfig {
  static final AppNetConfig _instance = AppNetConfig._();

  AppNetConfig._();

  static AppNetConfig getInstance() {
    return _instance;
  }

  NetConfig? _config;

  void initConfig(NetConfig config) {
    _config = config;
  }

  NetConfig getConfig() {
    if (_config == null) {
      throw Exception('config must init!');
    }
    return _config!;
  }
}
