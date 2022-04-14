import 'package:fluro/fluro.dart';
import 'package:fluroDemo/router/config/app_page_path.dart';
import 'package:fluroDemo/screen/detail/detail_screen.dart';
import 'package:fluroDemo/screen/home_screen.dart';
import 'package:fluroDemo/screen/login/login_screen.dart';
import 'package:fluroDemo/screen/setting/setting_external_message.dart';
import 'package:fluroDemo/screen/setting/setting_message_screen.dart';
import 'package:fluroDemo/screen/splash/guide_screen.dart';
import 'package:fluroDemo/screen/splash/splash_screen.dart';

///
/// @date: 2022/4/8 15:19
/// @author: TangRen
/// @remark:
///

final Map<String, Handler> pageHandler = {
  AppPagePath.splash:
      Handler(handlerFunc: (context, params) => const SplashScreen()),
  AppPagePath.guide:
      Handler(handlerFunc: (context, params) => const GuideScreen()),
  AppPagePath.home:
      Handler(handlerFunc: (context, params) => const HomeScreen()),
  AppPagePath.detail:
      Handler(handlerFunc: (context, params) => const DetailScreen()),
  AppPagePath.login:
      Handler(handlerFunc: (context, params) => const LoginScreen()),
  AppPagePath.settingMessage:
      Handler(handlerFunc: (context, params) => const SettingMessage()),
  AppPagePath.settingMessageExternal:
      Handler(handlerFunc: (context, params) => const SettingExternalMessage()),
};
