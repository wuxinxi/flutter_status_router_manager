import 'package:fluroDemo/utils/sp_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../model/app_login_status_model.dart';
import 'app_constants.dart';

///
/// @date: 2022/4/8 23:49
/// @author: TangRen
/// @remark:
///
class AppManager {
  static final AppManager _instance = AppManager._();

  AppManager._();

  static AppManager getInstance() {
    return _instance;
  }

  bool isLogin = false;

  void setLogin(BuildContext context, bool value) {
    isLogin = value;
    SpUtils.setBool(AppConstants.spKeyLogin, value);
    context.read<AppLoginStatusModel>().login = value;
  }
}
