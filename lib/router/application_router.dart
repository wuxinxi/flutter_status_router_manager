import 'package:fluroDemo/router/config/app_page_config.dart';
import 'package:lib_router/app_router.dart';

///
/// @date: 2022/4/8 15:52
/// @author: TangRen
/// @remark:
///
class ApplicationRouter {
  static setupRouter() {
    pageHandler.forEach((path, handler) {
      AppRouter.appRouter.define(path, handler: handler);
    });
  }
}
