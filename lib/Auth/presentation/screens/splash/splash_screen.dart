import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solvers/core/app/app_prefs.dart';
import 'package:solvers/core/assets/app_assets.dart';
import 'package:solvers/core/global/resources/strings_manger.dart';
import 'package:solvers/core/global/resources/values_manger.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/routes/app_routes.dart';
import 'package:solvers/core/services/services_locator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  final AppPreferences _appPreferences = sl<AppPreferences>();

  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  _goNext() async {
    _appPreferences.isClientLoggedIn().then(
      (isClientLoggedIn) {
        if (isClientLoggedIn) {
          Navigator.pushReplacementNamed(context, Routes.layoutClient);
        } else {
          _appPreferences.isTechnicianLoggedIn().then(
            (isTechnicianLoggedIn) {
              if (isTechnicianLoggedIn) {
                Navigator.pushReplacementNamed(context, Routes.layoutTech);
              } else {
                Navigator.pushReplacementNamed(context, Routes.userLoginRoute);
              }
            },
          );
        }
      },
    );
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
        color: ColorManager.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage(
                ImageAssets.splashLogo,
              ),
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
