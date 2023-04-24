import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solvers/core/assets/app_assets.dart';
import 'package:solvers/core/global/resources/strings_manger.dart';
import 'package:solvers/core/global/resources/values_manger.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  // final AppPreferences _appPreferences = sl<AppPreferences>();

  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  _goNext() async {
    Navigator.pushReplacementNamed(context, Routes.layoutClient);
    // _appPreferences.isDoctorLoggedIn().then((isDoctorLoggedIn) {
    //   if (isDoctorLoggedIn) {
    //     Navigator.pushReplacementNamed(context, Routes.doctorMainRoute);
    //   } else {
    //     _appPreferences.isPatientLoggedIn().then((isPatientLoggedIn) {
    //       if (isPatientLoggedIn) {
    //         Navigator.pushReplacementNamed(context, Routes.patientMainRoute);
    //       } else {
    //         _appPreferences
    //             .isOnBoardingScreenViewed()
    //             .then((isOnBoardingScreenViewed) {
    //           if (isOnBoardingScreenViewed) {
    //             Navigator.pushReplacementNamed(context, Routes.toggleRoute);
    //           } else {
    //             Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
    //           }
    //         });
    //       }
    //     });
    //   }
    // });
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: Container(
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [
        //       Color(0xFFF6A064),
        //       Color(0xFFF24223),
        //       Color(0xFFEA7A6C),
        //       Color.fromARGB(15, 240, 225, 214),
        //     ],
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     stops: [0.0, 0.3, 0.6, 1.0],
        //     tileMode: TileMode.clamp,
        //   ),
        // ),
        color: ColorManager.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage(
                ImageAssets.splashLogo,
              ),
              // height: 100,
              // width: 90,
            ),
            Row(
              children: const [
                Expanded(
                  child: Text(
                    AppStrings.welcome,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: AppSize.s40),
                  ),
                ),
              ],
            ),
            const Text(
              AppStrings.splashMessage,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: AppSize.s25),
            ),
          ],
        ),
      ),
    );
  }
}
