// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';
import 'package:solvers/Auth/presentation/screens/login/login_screen.dart';
import 'package:solvers/Auth/presentation/screens/toggle/toggle_scrren.dart';
import 'package:solvers/client/presentation/screens/layout_client_page.dart';
import 'package:solvers/core/routes/app_routes.dart';
import 'package:solvers/solver/presentation/screens/create_offer_tech_page.dart';
import 'package:solvers/solver/presentation/screens/layout_tech_page.dart';
import 'package:solvers/test.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();

  static const MyApp instance = MyApp._internal(); // singleton

  factory MyApp() => instance; //factory for the class instance

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: LoginScreen(),
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
    );
  }
}
