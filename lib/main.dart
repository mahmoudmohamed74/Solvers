import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvers/bloc_observer.dart';
import 'package:solvers/core/app/app.dart';
import 'package:solvers/core/services/services_locator.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:solvers/.env';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = stripePublishableKey;
  await Stripe.instance.applySettings();
  await Firebase.initializeApp();
  await ServicesLocator().init();
  BlocOverrides.runZoned(
    () {
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}
