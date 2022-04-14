import 'dart:async';
import 'dart:math';

import 'package:fluroDemo/router/interceptor/guide_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:lib_router/app_router.dart';

import '../../router/config/app_page_path.dart';

///
/// @date: 2022/4/13 11:10
/// @author: Sensi
/// @remark:
///
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: SweepGradient(colors: [
        Colors.primaries[Random().nextInt(Colors.primaries.length)],
        Colors.primaries[Random().nextInt(Colors.primaries.length)],
        Colors.primaries[Random().nextInt(Colors.primaries.length)],
        Colors.primaries[Random().nextInt(Colors.primaries.length)],
        Colors.primaries[Random().nextInt(Colors.primaries.length)],
        Colors.primaries[Random().nextInt(Colors.primaries.length)]
      ])),
      child: Stack(
        children: [
          Positioned(
              top: 50,
              right: 10,
              child: TimerCount(
                  max: 5,
                  counterDone: () => AppRouter.navigateTo(
                      context, AppPagePath.home,
                      interceptor: GuideInterceptor(), clearStack: true)))
        ],
      ),
    );
  }
}

class TimerCount extends StatefulWidget {
  final int max;
  final Function counterDone;

  const TimerCount({Key? key, required this.max, required this.counterDone})
      : super(key: key);

  @override
  State<TimerCount> createState() => _TimerCountState();
}

class _TimerCountState extends State<TimerCount> {
  final StreamController<int> _controller = StreamController();
  var count = 0;

  void timer() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      count--;
      if (count >= 0) {
        _controller.sink.add(count);
        return true;
      }
      _controller.close();
      widget.counterDone.call();
      return false;
    });
  }

  @override
  void initState() {
    count = widget.max;
    super.initState();
    timer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      height: 30,
      width: 30,
      child: StreamBuilder<int>(
        initialData: widget.max,
        stream: _controller.stream,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          return Center(
            child: Text('${snapshot.data ?? widget.max}',
                style: const TextStyle(color: Colors.black, fontSize: 14)),
          );
        },
      ),
    );
  }
}
