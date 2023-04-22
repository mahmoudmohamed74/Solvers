// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';
import 'package:solvers/Auth/presentation/screens/login/login_screen.dart';
import 'package:solvers/Auth/presentation/screens/success/success_screen.dart';
import 'package:solvers/client/presentation/screens/create_new_request_page.dart';
import 'package:solvers/client/presentation/screens/help_page.dart';
import 'package:solvers/client/presentation/screens/layout_client_page.dart';
import 'package:solvers/client/presentation/screens/offers_client_page.dart';
import 'package:solvers/client/presentation/screens/payment_done_page.dart';
import 'package:solvers/client/presentation/screens/profile_page_client.dart';
import 'package:solvers/client/presentation/screens/request_status_page.dart';
import 'package:solvers/client/presentation/screens/requst_done_page.dart';
import 'package:solvers/core/routes/app_routes.dart';

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
      home: HelpPage(),
      // onGenerateRoute: RouteGenerator.getRoute,
      // initialRoute: Routes.splashRoute,
    );
  }
}
