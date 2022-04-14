import 'package:fluroDemo/router/config/app_page_path.dart';
import 'package:fluroDemo/utils/app_constants.dart';
import 'package:fluroDemo/utils/sp_utils.dart';
import 'package:flutter/material.dart';
import 'package:lib_router/app_router.dart';

///
/// @date: 2022/4/13 11:10
/// @author: Sensi
/// @remark:
///
class GuideScreen extends StatefulWidget {
  const GuideScreen({Key? key}) : super(key: key);

  @override
  _GuideScreenState createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemBuilder: (context, index) => _guide(index),
            itemCount: 2,
            onPageChanged: (index) => setState(() => currentIndex = index),
          ),
          Positioned(
            bottom: 70,
            right: 0,
            left: 0,
            child: _guideDot(currentIndex),
          ),
          Positioned(
            bottom: 20,
            right: 10,
            child: Opacity(
                opacity: currentIndex == 0 ? 0 : 1,
                child: TextButton(
                    onPressed: () {
                      SpUtils.setBool(AppConstants.spSkipGuide, true);
                      AppRouter.navigateTo(context, AppPagePath.home,
                          clearStack: true);
                    },
                    child: const Text('NEXT',
                        style: TextStyle(color: Colors.white)))),
          )
        ],
      ),
    );
  }

  _guide(index) {
    return index == 0
        ? _guideItem(Colors.orange, 'Flutter ~ world', Icons.flutter_dash)
        : _guideItem(Colors.orange, 'Welcome 👏', Icons.face);
  }

  _guideItem(Color color, String content, IconData icon) {
    return Container(
      color: color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 100.0),
            const Padding(padding: EdgeInsets.all(5)),
            Text(
              content,
              style: const TextStyle(color: Colors.white, fontSize: 25),
            )
          ],
        ),
      ),
    );
  }

  _guideDot(index) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == 0 ? Colors.white : Colors.grey,
            ),
            height: 10,
            width: 10,
          ),
          const Padding(padding: EdgeInsets.all(3)),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == 0 ? Colors.grey : Colors.white,
            ),
            height: 10,
            width: 10,
          ),
        ]);
  }
}
