import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/image_utils.dart';

///
/// @date: 2022/4/8 23:26
/// @author: TangRen
/// @remark:
///
///
class RedProgressIndicator extends ProgressIndicator {
  const RedProgressIndicator({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CompanionIndicatorState();
}

class _CompanionIndicatorState extends State<RedProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 70.h,
        width: 70.w,
        child: RotationTransition(
          turns: _animationController,
          child: Image.asset(LocaleImages.loading),
        ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
