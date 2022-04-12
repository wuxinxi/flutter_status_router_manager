import 'package:fluroDemo/model/app_login_status_model.dart';
import 'package:fluroDemo/model/app_recipe_model.dart';
import 'package:fluroDemo/model/app_tab_model.dart';
import 'package:fluroDemo/router/application_router.dart';
import 'package:fluroDemo/utils/app_constants.dart';
import 'package:fluroDemo/utils/app_manager.dart';
import 'package:fluroDemo/utils/sp_utils.dart';
import 'package:flutter/material.dart';
import 'package:lib_router/app_router.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ApplicationRouter.setupRouter();
  AppManager.getInstance().isLogin =
      await SpUtils.getBool(AppConstants.spKeyLogin);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
