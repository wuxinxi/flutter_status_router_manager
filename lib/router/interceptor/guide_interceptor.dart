import 'package:fluroDemo/router/config/app_page_path.dart';
import 'package:fluroDemo/utils/app_constants.dart';
import 'package:fluroDemo/utils/sp_utils.dart';
import 'package:flutter/material.dart';
import 'package:lib_router/app_router.dart';
import 'package:lib_router/redirect_interceptor.dart';

///
/// @date: 2022/4/13 13:58
/// @author: Sensi
/// @remark:
///
class GuideInterceptor extends RedirectInterceptor {
  @override
  Future navigateTo(BuildContext context) =>
      AppRouter.navigateTo(context, AppPagePath.guide);

  @override
  Future<bool> needRedirect() async =>
      !await SpUtils.getBool(AppConstants.spSkipGuide);
}
