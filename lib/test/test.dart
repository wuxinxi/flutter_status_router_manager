import 'dart:async';

import 'package:fluroDemo/test/queue.dart';

///
/// @date: 2022/4/27 14:36
/// @author: Sensi
/// @remark:
///

void main() async {
  String s = 'teams hhh';
  print(s.substring('teams '.length, s.length));

  var queue = Queue();

  final result1 = queue
      .add(() =>
          Future.delayed(const Duration(seconds: 2)).then((value) => 'task1'))
      .then((value) {
    print('task1');
    queue.clear();
  });
  final result2 = queue
      .add(() =>
          Future.delayed(const Duration(seconds: 2)).then((value) => 'task2'))
      .then((value) => print('task2'));
  final result3 = queue
      .add(() =>
          Future.delayed(const Duration(seconds: 2)).then((value) => 'task3'))
      .then((value) => print('task3'));

  Future.delayed(Duration(seconds: 3)).then((value) {
    print('${DateTime.now()} main>>(:30)>>${queue.nextCycle.length}');
  });

}

Timer? timer;

void search(Function function, {duration = 500}) {
  timer?.cancel();
  timer = Timer(Duration(milliseconds: duration), () {
    function.call();
    timer = null;
  });
}
