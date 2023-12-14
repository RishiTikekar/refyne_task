import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:testassign/app_routing/pages.dart';
import 'package:testassign/app_routing/route_page.dart';

class RDelegate extends RouterDelegate<RoutePage>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  static final RDelegate _i = RDelegate._();
  static RDelegate get i => _i;

  RDelegate._() : _navigationKey = GlobalKey<NavigatorState>();

  List<RoutePage> routes = [RepoListPage()];

  late GlobalKey<NavigatorState> _navigationKey;

  BuildContext get getCtx => _navigationKey.currentState!.context;

  pushRoute(RoutePage page) {
    routes = [...routes, page];
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _navigationKey,
      pages: routes,
      onPopPage: (route, _) {
        if (routes.length > 1) {
          routes.removeLast();
          routes = [...routes];
          notifyListeners();
          return true;
        } else {
          return false;
        }
      },
      onGenerateRoute: (settings) => routes.last.createRoute(context),
    );
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigationKey;

  @override
  Future<void> setInitialRoutePath(RoutePage configuration) {
    routes = [RepoListPage()];
    return super.setInitialRoutePath(configuration);
  }

  @override
  Future<void> setNewRoutePath(configuration) async {
    //  RoutePage page= routes.firstWhere((element) => element.routeName == configuration.name);
    // routes.remove
  }
}
