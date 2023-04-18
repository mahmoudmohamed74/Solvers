// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';
import 'package:solvers/Auth/presentation/screens/success/success_screen.dart';
import 'package:solvers/core/routes/app_routes.dart';
import 'package:solvers/test.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();

  static const MyApp instance = MyApp._internal(); // singleton

  factory MyApp() => instance; //factory for the class instance

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // @override
  // void didChangeDependencies() {
  //   _appPreferences.getLocal().then((local) => {context.setLocale(local)});
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TestScreen(),
      // onGenerateRoute: RouteGenerator.getRoute,
      // initialRoute: Routes.splashRoute,
      // theme: getAppTheme(),
    );
  }
}
