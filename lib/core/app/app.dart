// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvers/Auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:solvers/client/presentation/controller/client_cubit.dart';
import 'package:solvers/client/presentation/screens/layout_client_page.dart';
import 'package:solvers/client/presentation/screens/request_status_client_page.dart';
import 'package:solvers/core/routes/app_routes.dart';
import 'package:solvers/core/services/services_locator.dart';
import 'package:solvers/solver/presentation/controller/tech_cubit.dart';
import 'package:solvers/solver/presentation/screens/my_request_tech_page.dart';
import 'package:solvers/solver/presentation/screens/request_status_tech_page.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<FirebaseAuthCubit>(
          create: (BuildContext context) => sl<FirebaseAuthCubit>(),
        ),
        BlocProvider<ClientCubit>(
            create: (BuildContext context) => sl<ClientCubit>()
            // ..getOrder("IjPMaJsgP5XJ8u5AQvzrwijWCrp2"),
            ),
        BlocProvider<TechCubit>(
            create: (BuildContext context) => sl<TechCubit>()
            // ..getOrderTech(FirebaseAuthCubit.get(context).techData!.techId),
            ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: TechRequestStatusPage(),
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashRoute,
      ),
    );
  }
}
