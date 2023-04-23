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
import 'package:solvers/client/presentation/screens/chat_page_client_page.dart';
import 'package:solvers/client/presentation/screens/create_new_request_page.dart';
import 'package:solvers/client/presentation/screens/help_page.dart';
import 'package:solvers/client/presentation/screens/home_client_page.dart';
import 'package:solvers/client/presentation/screens/layout_client_page.dart';
import 'package:solvers/client/presentation/screens/my_requests_page.dart';
import 'package:solvers/client/presentation/screens/offers_client_page.dart';
import 'package:solvers/client/presentation/screens/profile_page_client.dart';
import 'package:solvers/client/presentation/screens/request_status_page.dart';
import 'package:solvers/client/presentation/screens/requst_done_page.dart';
import 'package:solvers/core/global/resources/strings_manger.dart';
import 'package:solvers/test.dart';

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

  // client routes
  static const String clientLayout = "/clientLayout";
  static const String createNewRequest = "/createNewRequest";
  static const String homeClient = "/homeClient";
  static const String myRequests = "/myRequests";
  static const String help = "/help";
  static const String chatClient = "/chatClient";
  static const String offersClint = "/offersClint";
  static const String paymentDone = "/paymentDone";
  static const String profileClient = "/profileClient";
  static const String requestStatus = "/requestStatus";
  static const String requestDone = "/requestDone";
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

      // client routes
      case Routes.clientLayout:
        return MaterialPageRoute(builder: (_) => const ClientLayout());
      case Routes.createNewRequest:
        return MaterialPageRoute(builder: (_) => const ClientNewRequestPage());
      case Routes.homeClient:
        return MaterialPageRoute(builder: (_) => const ClientHomePage());
      case Routes.myRequests:
        return MaterialPageRoute(builder: (_) => const ClientMyRequestPage());
      case Routes.help:
        return MaterialPageRoute(builder: (_) => HelpPage());
      case Routes.chatClient:
        return MaterialPageRoute(builder: (_) => const ClientChatPage());
      case Routes.offersClint:
        return MaterialPageRoute(builder: (_) => const ClientOffersPage());
      case Routes.paymentDone:
        return MaterialPageRoute(builder: (_) => ResetPasswordScreen());
      case Routes.profileClient:
        return MaterialPageRoute(builder: (_) => ClientProfilePage());
      case Routes.requestStatus:
        return MaterialPageRoute(
            builder: (_) => const ClientRequestStatusPage());
      case Routes.requestDone:
        return MaterialPageRoute(builder: (_) => const ClientRequestDonePage());
      case Routes.testRoute:
        return MaterialPageRoute(builder: (_) => const TestScreen());
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
