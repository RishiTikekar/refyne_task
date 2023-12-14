import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:testassign/app_routing/route_page.dart';
import 'package:testassign/feature/error_screen/UI/error_screen.dart';
import 'package:testassign/feature/respository_screen/UI/screens/repository_detail_screen.dart';
import 'package:testassign/feature/respository_screen/UI/screens/respository_list_screen.dart';
import 'package:testassign/feature/respository_screen/models/repository_model.dart';

class RepoListPage extends Page with RoutePage {
  RepoListPage() : super(key: const ValueKey('/repoList'));
  static RoutePage? canParseRoute(Uri uri) {
    if (uri.path == "/repoList" || uri.path == "/") {
      return RepoListPage();
    }
    return null;
  }

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (_) => const RepositoryListScreen(),
    );
  }

  @override
  String? get routeName => '/repoList';
}

class RepoDetailsPage extends Page with RoutePage {
  final RepositoryModel repository;
  RepoDetailsPage({
    required this.repository,
  }) : super(key: const ValueKey('/repoDetails'));

  static RoutePage? canParseRoute(Uri uri) {
    if (uri.path == "/repoDetails" &&
        uri.queryParameters.isNotEmpty &&
        uri.queryParameters.containsKey('repository')) {
      Map parsedRepo =
          jsonDecode(uri.queryParameters['repository'] ?? '''{}''');

      return RepoDetailsPage(
        repository: RepositoryModel.fromMap(parsedRepo),
      );
    }

    return null;
  }

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (_) => RepositoryDetailScreen(
        repository: repository,
      ),
    );
  }

  @override
  String? get routeName => '/repoDetails';
}

class RouteNotFoundPage extends Page with RoutePage {
  const RouteNotFoundPage() : super(key: const ValueKey('/error'));

  static RoutePage? canParseRoute(Uri uri) {
    if (uri.path == "/error") {
      return RouteNotFoundPage();
    }

    return null;
  }

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      builder: (_) => const ErrorScreen(),
      settings: this,
    );
  }

  @override
  String? get routeName => '/error';
}
