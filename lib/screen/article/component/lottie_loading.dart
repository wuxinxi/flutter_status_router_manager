import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:lottie/lottie.dart';

///
/// @date: 2022/5/19 15:21
/// @author: Sensi
/// @remark:
///

class LottieHeader extends Header {
  @override
  Widget contentBuilder(
      BuildContext context,
      RefreshMode refreshState,
      double pulledExtent,
      double refreshTriggerPullDistance,
      double refreshIndicatorExtent,
      AxisDirection axisDirection,
      bool float,
      Duration? completeDuration,
      bool enableInfiniteRefresh,
      bool success,
      bool noMore) {
    print('${DateTime.now()} contentBuilder>>(LottieHeader:25)>>success=$success noMore=$noMore $refreshState' );
    return Container(
      height: 45,
      width: 45,
      margin: const EdgeInsets.all(5),
      child: Center(
          child: Lottie.asset('assets/lottie_loading.json',
              animate: refreshState == RefreshMode.drag ? false : true)),
    );
  }
}

class LottieFooter extends Footer {
  @override
  Widget contentBuilder(
      BuildContext context,
      LoadMode loadState,
      double pulledExtent,
      double loadTriggerPullDistance,
      double loadIndicatorExtent,
      AxisDirection axisDirection,
      bool float,
      Duration? completeDuration,
      bool enableInfiniteLoad,
      bool success,
      bool noMore) {
    if (loadState!=LoadMode.inactive) {
      return Container(
        height: 45,
        width: 45,
        margin: const EdgeInsets.all(5),
        child: Center(
            child: Lottie.asset('assets/lottie_loading.json'),
      ));
    }
    if (success) {
      return Container();
    }{
      return const SizedBox(
          height: 70, child: Center(child: Text("onFiailed")));
    }
  }
}
