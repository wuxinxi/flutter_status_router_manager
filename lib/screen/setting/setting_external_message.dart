import 'package:fluroDemo/model/app_tab_model.dart';
import 'package:fluroDemo/screen/setting/setting_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lib_router/app_router.dart';
import 'package:provider/provider.dart';

///
/// @date: 2022/4/9 10:22
/// @author: TangRen
/// @remark:
///
class SettingExternalMessage extends StatelessWidget {
  const SettingExternalMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('外部消息设置')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SettingItem(
                title: '返回至上一级',
                subTitle: '返回至上一级消息设置页面',
                itemBean: SettingItemBean(isArrow: true),
                onPressed: () => AppRouter.appRouter.pop(context)),
            const Divider(),
            SettingItem(
                title: '返回至首页',
                subTitle: '返回至首页设置页tab',
                itemBean: SettingItemBean(isArrow: true),
                onPressed: () => AppRouter.appRouter.popToHome(context)),
            const Divider(),
            SettingItem(
                title: '返回至首页',
                subTitle: '返回至首页Index tab',
                itemBean: SettingItemBean(isArrow: true),
                onPressed: () {
                  context.read<AppTabModel>().curIndex = 0;
                  AppRouter.appRouter.popToHome(context);
                }),
            const Divider()
          ],
        ),
      ),
    );
  }
}
