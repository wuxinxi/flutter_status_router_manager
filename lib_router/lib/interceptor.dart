import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lib_router/app_router.dart';

///
/// @date: 2022/4/29 14:34
/// @author: Sensi
/// @remark:
///

abstract class Interceptor {
  Interceptor? next;

  Future<bool> needRedirect();

  Future navigateTo(BuildContext context);
}

class LoginInterceptor extends Interceptor {
  @override
  Future navigateTo(BuildContext context) async {
    if (await needRedirect()) {
      return AppRouter.navigateTo(context, '/login');
    } else {
      return next?.navigateTo(context);
    }
  }

  @override
  Future<bool> needRedirect() async {
    return Random().nextBool();
  }
}
