import 'package:fluroDemo/model/app_tab_model.dart';
import 'package:fluroDemo/screen/article/article_screen.dart';
import 'package:fluroDemo/screen/explore/explore_screen.dart';
import 'package:fluroDemo/screen/index/index_screen.dart';
import 'package:fluroDemo/screen/setting/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

///
/// @date: 2022/4/8 15:28
/// @author: TangRen
/// @remark:
///
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> pages = const [
    IndexScreen(),
    ExploreScreen(),
    ArticleScreen(),
    SettingScreen()
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(const BoxConstraints.expand(),
        context: context,
        designSize: const Size(375, 812),
        orientation: Orientation.portrait);
    return Scaffold(
        body: Consumer(
            builder: (BuildContext context, AppTabModel model, Widget? child) =>
                IndexedStack(index: model.curIndex, children: pages)),
        bottomNavigationBar: Consumer(
            builder: (BuildContext context, AppTabModel model, Widget? child) =>
                BottomNavigationBar(
                  showUnselectedLabels: false,
                  showSelectedLabels: false,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: model.curIndex,
                  onTap: (index) => model.curIndex = index,
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home_mini), label: ''),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.explore), label: ''),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.article), label: ''),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.settings), label: ''),
                  ],
                )));
  }
}
