import 'package:fluroDemo/router/config/app_page_path.dart';
import 'package:flutter/material.dart';
import 'package:lib_router/app_router.dart';
import 'package:lib_router/redirect_interceptor.dart';

import '../../utils/app_constants.dart';
import '../../utils/sp_utils.dart';

///
/// @date: 2022/4/8 23:33
/// @author: TangRen
/// @remark:
///
class LoginInterceptor extends RedirectInterceptor {
  @override
  Future navigateTo(BuildContext context) {
    return AppRouter.navigateTo(context, AppPagePath.login);
  }

  @override
  Future<bool> needRedirect() {
    return SpUtils.getBool(AppConstants.spKeyLogin, true);
  }
}
