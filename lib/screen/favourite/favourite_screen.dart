import 'dart:developer';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../../router/config/init.dart';

///
/// @date: 2022/4/19 14:21
/// @author: Sensi
/// @remark:
///
class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: AppRouter2.generator,
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('嵌套路由')),
        body: Center(
            child: TextButton(
                onPressed: () =>
                    AppRouter2.navigateTo(context, '/detail/page2'),
                child: const Text('前往嵌套的子页面'))));
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        log('${DateTime.now()} build>>(Page2:47)>>${AppRouter2.canPop(context)}');
        return false;
      },
      child: Scaffold(
          appBar: AppBar(title: const Text('嵌套的自页面')),
          body: Center(
              child: TextButton(
                  onPressed: () => AppRouter2.pop(context),
                  child: const Text('返回嵌套首页')))),
    );
  }
}

class AppRouterConfig2 {
  static final Map<String, Handler> pageHandler = {
    '/': Handler(handlerFunc: (context, params) => const Page1()),
    '/detail/page2': Handler(handlerFunc: (context, params) => const Page2())
  };

  static setup() {
    pageHandler.forEach((routePath, handler) {
      AppRouter2.define(routePath, handler: handler);
    });
  }
}
