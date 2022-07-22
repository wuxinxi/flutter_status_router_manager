///
/// @date: 2022/4/20 20:52
/// @author: Sensi
/// @remark:
///
import 'dart:developer';

import 'package:flutter/material.dart';

class StickyPage extends StatefulWidget {
  const StickyPage({Key? key}) : super(key: key);

  @override
  State<StickyPage> createState() => _StickyPageState();
}

class _StickyPageState extends State<StickyPage> {
  _header() {
    return SizedBox(
        height: 300,
        width: double.infinity,
        child: Column(children: [
          Container(
              height: 250,
              width: double.infinity,
              child: Image.network(
                'http://dingyue.ws.126.net/2020/0515/465567a6j00qadpfz001cc000hs00b4c.jpg',
                // 'http://up.enterdesk.com/edpic/4d/c2/1f/4dc21f4a9c86dd85185bdf553f4a14d2.jpg',
                fit: BoxFit.fill,
              )),
          Container(height: 50, color: Colors.red[300])
        ]));
  }
  // 'http://dingyue.ws.126.net/2020/0515/465567a6j00qadpfz001cc000hs00b4c.jpg',

  _stickHeader() {
    return SizedBox(
        width: double.infinity,
        height: 100,
        child: Column(children: [
          ClipRect(
              child: Align(
            alignment: Alignment.bottomRight,
            heightFactor: 0.185,
            child: Image.network(
              'http://dingyue.ws.126.net/2020/0515/465567a6j00qadpfz001cc000hs00b4c.jpg',
              // 'http://up.enterdesk.com/edpic/4d/c2/1f/4dc21f4a9c86dd85185bdf553f4a14d2.jpg'
            ),
          )),
          // Container(height: 50, color: Colors.blue[300]),
          Container(height: 50, color: Colors.red[300])
        ]));
  }

  final ScrollController _scrollController = ScrollController();

  bool showStick = false;
  double opacity = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      // log('${_scrollController.offset}');
      if (_scrollController.offset >= 200) {
        showStick = true;
        if (opacity != 1) {
          setState(() {
            opacity = 1;
          });
        }
      } else {
        showStick = false;
        if (opacity == 1) {
          setState(() {
            opacity = 0;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    log('build~');
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(child: _header()),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => ListTile(title: Text('$index')),
                      childCount: 100))
            ],
          ),
          Opacity(
            opacity: opacity,
            child: _stickHeader(),
          )
        ],
      ),
    ));
  }
}

class __MyPathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height - 50); //从图片的中间上面坐标
    path.lineTo(size.width, size.height - 50); //图片的左下角坐标
    path.lineTo(size.width, size.height); //图片的右下角左边
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
