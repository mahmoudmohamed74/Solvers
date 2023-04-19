import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:solvers/core/app/app.dart';
import 'package:solvers/core/services/services_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  ServicesLocator().init();
  runApp(MyApp());
}
