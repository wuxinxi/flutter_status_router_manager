import 'package:fluroDemo/utils/app_constants.dart';
import 'package:fluroDemo/utils/sp_utils.dart';
import 'package:flutter/material.dart';

///
/// @date: 2022/4/9 12:26
/// @author: Sensi
/// @remark:
///
class AppLoginStatusModel extends ChangeNotifier {
  bool _login = false;

  bool get login => _login;

  set login(bool value) {
    _login = value;
    notifyListeners();
  }

  AppLoginStatusModel() {
    SpUtils.getBool(AppConstants.spKeyLogin).then((value) => login = value);
  }
}
