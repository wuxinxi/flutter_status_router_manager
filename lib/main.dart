import 'dart:developer';

import 'package:fluroDemo/model/app_login_status_model.dart';
import 'package:fluroDemo/model/app_recipe_model.dart';
import 'package:fluroDemo/model/app_tab_model.dart';
import 'package:fluroDemo/router/application_router.dart';
import 'package:fluroDemo/router/config/init.dart';
import 'package:fluroDemo/screen/favourite/favourite_screen.dart';
import 'package:fluroDemo/utils/app_config.dart';
import 'package:flutter/material.dart';
import 'package:lib_net/core/network_config.dart';
import 'package:lib_router/app_router.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ApplicationRouter.setupRouter();
  await AppRouterConfig2.setup();
  AppNetConfig.getInstance().initConfig(AppConfig());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('${DateTime.now()} build>>(MyApp:23)>>${AppRouter.hashCode}');
    log('${DateTime.now()} build>>(MyApp:23)>>${AppRouter.hashCode}');
    log('${DateTime.now()} build>>(MyApp:23)>>${AppRouter2.hashCode}');
    log('${DateTime.now()} build>>(MyApp:23)>>${AppRouter2.hashCode}');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppRecipeModel()),
        ChangeNotifierProvider(create: (context) => AppTabModel()),
        ChangeNotifierProvider(create: (context) => AppLoginStatusModel())
      ],
      child: MaterialApp(
        onGenerateRoute: AppRouter.generator,
      ),
    );
  }
}
