import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/sp_utils.dart';

///
/// @date: 2022/4/8 23:52
/// @author: TangRen
/// @remark:
///
class SettingItem extends StatefulWidget {
  final String title;
  final String? subTitle;
  final GestureTapCallback? onPressed;

  final SettingItemBean itemBean;

  const SettingItem(
      {Key? key,
      required this.title,
      this.subTitle,
      this.onPressed,
      required this.itemBean})
      : super(key: key);

  @override
  _SettingItemState createState() => _SettingItemState();
}

class _SettingItemState extends State<SettingItem> {
  _checkItem() {
    return FutureBuilder(
      future: SpUtils.getBool(widget.itemBean.key),
      initialData: widget.itemBean.init,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) =>
          CupertinoSwitch(
              activeColor: Colors.blue,
              value: snapshot.data ?? widget.itemBean.init,
              onChanged: (checked) {
                setState(() {});
                SpUtils.setBool(widget.itemBean.key, checked);
              }),
    );
  }

  _arrowRightItem() {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Icon(Icons.keyboard_arrow_right));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: widget.onPressed,
      title: Text(
        widget.title,
        style: const TextStyle(fontSize: 16),
      ),
      subtitle: widget.subTitle == null
          ? null
          : Text(widget.subTitle!, style: const TextStyle(fontSize: 13)),
      trailing: widget.itemBean.isArrow ? _arrowRightItem() : _checkItem(),
    );
  }
}

class SettingItemBean {
  bool init;
  String key;
  bool isArrow;

  SettingItemBean({this.init = false, this.key = '', this.isArrow = false});
}
