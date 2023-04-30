import 'package:flutter/material.dart';
import 'package:solvers/Auth/presentation/screens/forgot%20Password/forgot_password_screen.dart';
import 'package:solvers/Auth/presentation/screens/client/client_register_screen.dart';
import 'package:solvers/Auth/presentation/screens/login/login_screen.dart';
import 'package:solvers/Auth/presentation/screens/reset%20password/reset_password_screen.dart';
import 'package:solvers/Auth/presentation/screens/splash/splash_screen.dart';
import 'package:solvers/Auth/presentation/screens/success/success_screen.dart';
import 'package:solvers/Auth/presentation/screens/technician/technician_register_screen.dart';
import 'package:solvers/Auth/presentation/screens/toggle/toggle_scrren.dart';
import 'package:solvers/Auth/presentation/screens/verification/email_verification_screen.dart';
import 'package:solvers/Auth/presentation/screens/verification/phone_verification_screen.dart';
import 'package:solvers/client/presentation/screens/chat_page_client_page.dart';
import 'package:solvers/client/presentation/screens/create_new_request_page.dart';
import 'package:solvers/client/presentation/screens/help_page.dart';
import 'package:solvers/client/presentation/screens/home_client_page.dart';
import 'package:solvers/client/presentation/screens/layout_client_page.dart';
import 'package:solvers/client/presentation/screens/my_requests_client_page.dart';
import 'package:solvers/client/presentation/screens/offers_client_page.dart';
import 'package:solvers/client/presentation/screens/profile_page_client.dart';
import 'package:solvers/client/presentation/screens/request_status_client_page.dart';
import 'package:solvers/client/presentation/screens/requst_done_page.dart';
import 'package:solvers/core/global/resources/strings_manger.dart';
import 'package:solvers/solver/presentation/screens/create_offer_tech_page.dart';
import 'package:solvers/solver/presentation/screens/home_tech_page.dart';
import 'package:solvers/solver/presentation/screens/layout_tech_page.dart';
import 'package:solvers/solver/presentation/screens/my_request_tech_page.dart';
import 'package:solvers/solver/presentation/screens/profile_page_tech.dart';
import 'package:solvers/solver/presentation/screens/request_status_tech_page.dart';
import 'package:solvers/test.dart';

class Routes {
  static const String splashRoute = "/";
  static const String testRoute = "/test";
  static const String onBoardingRoute = "/onBoarding";
  static const String toggleRoute = "/toggle";
  static const String userLoginRoute = "/userLogin";
  static const String clientRegisterRoute = "/clientRegister";
  static const String technicianRegisterRoute = "/technicianRegister";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String resetPasswordRoute = "/resetPassword";
  static const String phoneVerificationRoute = "/phoneVerification";
  static const String emailVerificationRoute = "/emailVerification";
  static const String successRoute = "/success";

  // Client routes
  static const String layoutClient = "/layoutClient";
  static const String createNewRequest = "/createNewRequest";
  static const String homeClient = "/homeClient";
  static const String myRequestsClient = "/myRequestsClient";
  static const String help = "/help";
  static const String chatClient = "/chatClient";
  static const String offersClient = "/offersClint";
  static const String paymentDone = "/paymentDone";
  static const String profileClient = "/profileClient";
  static const String requestStatusClient = "/requestStatusClient";
  static const String requestDone = "/requestDone";

  // Tech routes
  static const String layoutTech = "/layoutTech";
  static const String homeTech = "/homeTech";
  static const String myRequestsTech = "/myRequestsTech";
  static const String chatTech = "/chatTech";
  static const String createOffersTech = "/createOffersTech";
  static const String profileTech = "/profileTech";
  static const String requestStatusTech = "/requestStatusTech";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.userLoginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.toggleRoute:
        return MaterialPageRoute(builder: (_) => const ToggleScreen());
      case Routes.clientRegisterRoute:
        return MaterialPageRoute(builder: (_) => ClientRegisterScreen());
      case Routes.technicianRegisterRoute:
        return MaterialPageRoute(
            builder: (_) => const TechnicianRegisterScreen());
      case Routes.phoneVerificationRoute:
        return MaterialPageRoute(
            builder: (_) => const PhoneVerificationScreen());
      case Routes.emailVerificationRoute:
        return MaterialPageRoute(builder: (_) => EmailVerificationScreen());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      case Routes.resetPasswordRoute:
        return MaterialPageRoute(builder: (_) => ResetPasswordScreen());
      case Routes.successRoute:
        return MaterialPageRoute(builder: (_) => const SuccessScreen());

      // client routes
      case Routes.layoutClient:
        return MaterialPageRoute(builder: (_) => const ClientLayout());
      case Routes.createNewRequest:
        return MaterialPageRoute(builder: (_) => const ClientNewRequestPage());
      case Routes.homeClient:
        return MaterialPageRoute(builder: (_) => const ClientHomePage());
      case Routes.myRequestsClient:
        return MaterialPageRoute(builder: (_) => const ClientMyRequestPage());
      case Routes.help:
        return MaterialPageRoute(builder: (_) => HelpPage());
      case Routes.chatClient:
        return MaterialPageRoute(builder: (_) => const ClientChatPage());
      case Routes.offersClient:
        return MaterialPageRoute(builder: (_) => const ClientOffersPage());
      case Routes.paymentDone:
        return MaterialPageRoute(builder: (_) => ResetPasswordScreen());
      case Routes.profileClient:
        return MaterialPageRoute(builder: (_) => ClientProfilePage());
      case Routes.requestStatusClient:
        return MaterialPageRoute(
            builder: (_) => const ClientRequestStatusPage());
      case Routes.requestDone:
        return MaterialPageRoute(builder: (_) => const ClientRequestDonePage());

      // client routes
      case Routes.layoutTech:
        return MaterialPageRoute(builder: (_) => const TechLayout());
      case Routes.createOffersTech:
        return MaterialPageRoute(builder: (_) => TechCreateOfferPage());
      case Routes.homeTech:
        return MaterialPageRoute(builder: (_) => const TechHomePage());
      case Routes.myRequestsTech:
        return MaterialPageRoute(builder: (_) => const TechMyRequestPage());
      case Routes.chatTech:
        return MaterialPageRoute(builder: (_) => const ClientChatPage());
      case Routes.profileTech:
        return MaterialPageRoute(builder: (_) => TechProfilePage());
      case Routes.requestStatusTech:
        return MaterialPageRoute(builder: (_) => const TechRequestStatusPage());

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
