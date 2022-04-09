import 'package:fluroDemo/screen/login/widget_progress_indicator.dart';
import 'package:flutter/material.dart';

///
/// @date: 2022/4/8 23:30
/// @author: TangRen
/// @remark:
///
class LoadingDialog extends Dialog {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: RedProgressIndicator());
  }
}
