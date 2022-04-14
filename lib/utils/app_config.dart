import 'package:dio/dio.dart';
import 'package:lib_net/core/network_config.dart';

///
/// @date: 2022/4/13 15:02
/// @author: Sensi
/// @remark:
///
class AppConfig extends NetConfig {
  @override
  String getAcceptLanguage() {
    // TODO: implement getAcceptLanguage
    throw UnimplementedError();
  }

  @override
  String getBaseUrl() {
    return 'https://www.wanandroid.com';
  }

  @override
  String getCurrentAccessToken() {
    // TODO: implement getCurrentAccessToken
    throw UnimplementedError();
  }

  @override
  String getEncryptPublicKey() {
    // TODO: implement getEncryptPublicKey
    throw UnimplementedError();
  }

  @override
  DateTime getLastRefreshTokenTime() {
    // TODO: implement getLastRefreshTokenTime
    throw UnimplementedError();
  }

  @override
  String getXApiKey() {
    // TODO: implement getXApiKey
    throw UnimplementedError();
  }

  @override
  List<Interceptor> interceptors() {
    // TODO: implement interceptors
    throw UnimplementedError();
  }

  @override
  void setCurrentAccessToken(String token) {
    // TODO: implement setCurrentAccessToken
  }

  @override
  void setRefreshTokenTime(DateTime time) {
    // TODO: implement setRefreshTokenTime
  }
}
