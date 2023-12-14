import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:testassign/app_routing/pages.dart';
import 'package:testassign/app_routing/route_page.dart';

class RParser extends RouteInformationParser<RoutePage> {
  @override
  Future<RoutePage> parseRouteInformation(RouteInformation routeInformation) {
    Uri uri = routeInformation.uri;

    RoutePage? routePage;

    routePage ??= RepoListPage.canParseRoute(uri);
    routePage ??= RepoDetailsPage.canParseRoute(uri);
    routePage ??= RouteNotFoundPage.canParseRoute(uri);

    return SynchronousFuture(routePage ?? const RouteNotFoundPage());
  }

  @override
  RouteInformation? restoreRouteInformation(RoutePage configuration) {
    return RouteInformation(location: configuration.routeName);
  }
}
