import 'package:flutter/cupertino.dart';

///
/// @date: 2022/4/9 12:10
/// @author: TangRen
/// @remark:
///
class AppTabModel extends ChangeNotifier {
  int _curIndex = 0;

  int get curIndex => _curIndex;

  set curIndex(int value) {
    _curIndex = value;
    notifyListeners();
  }
}
