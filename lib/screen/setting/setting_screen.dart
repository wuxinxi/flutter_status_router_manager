import 'package:fluroDemo/router/config/app_page_path.dart';
import 'package:fluroDemo/router/interceptor/login_interceptor.dart';
import 'package:fluroDemo/screen/setting/setting_item.dart';
import 'package:fluroDemo/utils/sp_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lib_router/app_router.dart';
import 'package:provider/provider.dart';

import '../../model/app_login_status_model.dart';
import '../../utils/app_constants.dart';

///
/// @date: 2022/4/8 23:01
/// @author: TangRen
/// @remark:
///
class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SettingItem(
              title: '自动更新',
              subTitle: '开启后，有新版自动下载更新',
              itemBean: SettingItemBean(key: 'push_key'),
            ),
            const Divider(),
            SettingItem(
              title: '水印图片',
              subTitle: '在上传的图片添加水印',
              itemBean: SettingItemBean(key: 'key2'),
            ),
            const Divider(),
            SettingItem(
              title: '内置音效',
              subTitle: '应用内按钮点击音效',
              itemBean: SettingItemBean(key: 'key3'),
            ),
            const Divider(),
            SettingItem(
              title: '视频自动播放',
              subTitle: '移动流量和WIFI',
              itemBean: SettingItemBean(isArrow: true),
            ),
            const Divider(),
            SettingItem(
              title: '消息设置',
              itemBean: SettingItemBean(isArrow: true),
              onPressed: () => AppRouter.navigateTo(
                  context, AppPagePath.settingMessage,
                  interceptor: LoginInterceptor()),
            ),
            const Divider(),
            SettingItem(
              title: '我的收藏',
              itemBean: SettingItemBean(isArrow: true),
            ),
            const Divider(),
            SettingItem(
              title: '跳过Guide',
              subTitle: '开启后，进入程序将跳过Guide page',
              itemBean: SettingItemBean(key: AppConstants.spSkipGuide),
            ),
            const Divider(),
            Consumer(
                builder: (context, AppLoginStatusModel statusModel, child) =>
                    SettingItem(
                      title: statusModel.login ? '退出登录' : '登录',
                      itemBean: SettingItemBean(isArrow: true),
                      onPressed: () {
                        if (statusModel.login) {
                          SpUtils.setBool(AppConstants.spKeyLogin, false);
                          context.read<AppLoginStatusModel>().login = false;
                        } else {
                          AppRouter.navigateTo(context, AppPagePath.login);
                        }
                      },
                    )),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
