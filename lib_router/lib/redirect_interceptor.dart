import 'package:flutter/material.dart';

///
/// @date: 2022/4/8 12:08
/// @author: TangRen
/// @remark:
///
abstract class RedirectInterceptor {
  bool needRedirect();

  Future navigateTo(BuildContext context);
}
