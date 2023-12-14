import 'package:flutter/material.dart';
import 'package:testassign/app_routing/route_info_parser.dart';
import 'package:testassign/app_routing/router_delegate.dart';
import 'package:testassign/utils/service_locator.dart';

void main() {
  initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: RDelegate.i,
      routeInformationParser: RParser(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}


/*
You need to build a two screen app 
Screen 1: Show list of repositories. A row should show full name, description and fork_count
Screen 2: on tapping above row a new screen should be pushed where you should show the repo’s full_name, description, owner avatar, owner login and owner type. 

list of repositories API: https://api.github.com/search/repositories?q=flutter

Expectations:
Code should be production quality 
Code should be clean, readable, organised, maintainable and scalable.
Using a st
Using a state management tool is a plus. 
Writing tests is a plus
*/