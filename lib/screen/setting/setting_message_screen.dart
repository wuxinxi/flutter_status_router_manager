import 'package:fluroDemo/router/config/app_page_path.dart';
import 'package:fluroDemo/screen/setting/setting_item.dart';
import 'package:flutter/material.dart';
import 'package:lib_router/app_router.dart';

///
/// @date: 2022/4/8 23:51
/// @author: TangRen
/// @remark:
///
class SettingMessage extends StatelessWidget {
  const SettingMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('消息设置',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SettingItem(
                title: '外部消息设置',
                itemBean: SettingItemBean(isArrow: true),
                onPressed: () => AppRouter.appRouter
                    .navigateTo(context, AppPagePath.settingMessageExternal)),
            const Divider(),
            SettingItem(
              title: '内部消息设置',
              itemBean: SettingItemBean(isArrow: true),
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}
