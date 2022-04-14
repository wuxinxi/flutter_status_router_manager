import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:lib_router/app_bundle.dart';
import 'package:lib_router/redirect_interceptor.dart';

///
/// @date: 2022/4/8 12:03
/// @author: TangRen
/// @remark:
///
class _AppRouter extends FluroRouter {
  ///bundle and routeSettings only one
  ///Both can use bundle.=>>routeSettings.arguments=bundle
  @override
  Future navigateTo(BuildContext context, String path,
      {bool replace = false,
      bool clearStack = false,
      bool maintainState = true,
      bool rootNavigator = false,
      RedirectInterceptor? interceptor,
      String? name,
      Bundle? bundle,
      TransitionType? transition,
      Duration? transitionDuration,
      RouteTransitionsBuilder? transitionBuilder,
      RouteSettings? routeSettings}) async {
    if (await interceptor?.needRedirect() ?? false) {
      return interceptor!.navigateTo(context);
    }
    if (bundle != null) {
      routeSettings = RouteSettings(arguments: bundle, name: name ?? path);
    }
    return super.navigateTo(context, path,
        replace: replace,
        clearStack: clearStack,
        maintainState: maintainState,
        rootNavigator: rootNavigator,
        transition: transition,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder,
        routeSettings: routeSettings);
  }

  ///back home and clear other page
  ///example:Home ->A->B->C:popToHome ->Home
  void popToHome(BuildContext context) {
    popUntil(context, (route) => route.isFirst);
  }

  @override
  void pop<T>(BuildContext context, [T? result]) {
    if (canPop(context)) {
      super.pop(context, result);
    }
  }

  void popUntil(BuildContext context, RoutePredicate predicate) {
    Navigator.popUntil(context, predicate);
  }

  bool canPop(BuildContext context) {
    return Navigator.canPop(context);
  }
}

final AppRouter = _AppRouter();
