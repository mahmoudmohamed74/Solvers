import 'package:flutter/material.dart';
import 'package:solvers/Auth/presentation/screens/forgot%20Password/forgot_password_screen.dart';
import 'package:solvers/Auth/presentation/screens/individual/individual_register_screen.dart';
import 'package:solvers/Auth/presentation/screens/login/login_screen.dart';
import 'package:solvers/Auth/presentation/screens/reset%20password/reset_password_screen.dart';
import 'package:solvers/Auth/presentation/screens/splash/splash_screen.dart';
import 'package:solvers/Auth/presentation/screens/success/success_screen.dart';
import 'package:solvers/Auth/presentation/screens/technician/technician_register_screen.dart';
import 'package:solvers/Auth/presentation/screens/verification/email_verification_screen.dart';
import 'package:solvers/Auth/presentation/screens/verification/phone_verification_screen.dart';
import 'package:solvers/core/global/resources/strings_manger.dart';

class Routes {
  static const String splashRoute = "/";
  static const String testRoute = "/test";
  static const String onBoardingRoute = "/onBoarding";
  static const String toggleRoute = "/toggle";
  static const String userLoginRoute = "/userLogin";
  static const String individualRegisterRoute = "/individualRegister";
  static const String technicianRegisterRoute = "/technicianRegister";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String resetPasswordRoute = "/resetPassword";
  static const String phoneVerificationRoute = "/phoneVerification";
  static const String emailVerificationRoute = "/emailVerification";
  static const String successRoute = "/success";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.userLoginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.individualRegisterRoute:
        return MaterialPageRoute(builder: (_) => IndividualRegisterScreen());
      case Routes.technicianRegisterRoute:
        return MaterialPageRoute(
            builder: (_) => const TechnicianRegisterScreen());
      case Routes.phoneVerificationRoute:
        return MaterialPageRoute(
            builder: (_) => const PhoneVerificationScreen());
      case Routes.emailVerificationRoute:
        return MaterialPageRoute(
            builder: (_) => const EmailVerificationScreen());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      case Routes.resetPasswordRoute:
        return MaterialPageRoute(builder: (_) => ResetPasswordScreen());
      case Routes.successRoute:
        return MaterialPageRoute(builder: (_) => const SuccessScreen());
      case Routes.testRoute:
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(
            AppStrings.noRouteFound,
          ),
        ),
        body: const Center(
          child: Text(
            AppStrings.noRouteFound,
          ),
        ),
      ),
    );
  }
}
