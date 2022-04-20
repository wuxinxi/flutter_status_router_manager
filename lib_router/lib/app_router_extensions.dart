import 'package:flutter/material.dart';
import 'package:lib_router/app_bundle.dart';

///
/// @date: 2022/4/19 08:54
/// @author: Sensi
/// @remark:
///
extension AppRouterContext on BuildContext {
  Bundle? _bundle() {
    final arguments = ModalRoute.of(this)?.settings.arguments;
    if (arguments != null) {
      return arguments as Bundle;
    }
    return null;
  }

  Bundle? get bundle => _bundle();
}
