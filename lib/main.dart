import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvers/bloc_observer.dart';
import 'package:solvers/core/app/app.dart';
import 'package:solvers/core/services/services_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await ServicesLocator().init();
  BlocOverrides.runZoned(
    () {
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}
