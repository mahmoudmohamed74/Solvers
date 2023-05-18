// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:solvers/Auth/presentation/widgets/default_text_button.dart';
import 'package:solvers/core/assets/app_assets.dart';
import 'package:solvers/core/global/resources/strings_manger.dart';
import 'package:solvers/core/global/resources/values_manger.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/routes/app_routes.dart';

class PhoneVerificationScreen extends StatelessWidget {
  const PhoneVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorManager.white,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: ColorManager.darkPrimary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: SizedBox(
            width: AppSize.inf,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  fit: BoxFit.fitHeight,
                  height: AppSize.s150,
                  image: AssetImage(
                    ImageAssets.otpImage,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s25,
                ),
                Text(
                  AppStrings.verifyYourPhoneNumber,
                  style: TextStyle(
                    fontSize: AppSize.s30,
                    color: ColorManager.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                Text(
                  AppStrings.otpSentToPhone,
                  style: TextStyle(
                    fontSize: AppSize.s20,
                    color: ColorManager.darkGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: AppSize.s25,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p35),
                  child: PinCodeTextField(
                    appContext: context,
                    autoFocus: true,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.scale,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.underline,
                      fieldHeight: 50,
                      fieldWidth: 40,
                      borderWidth: 1,
                      activeColor: ColorManager.white,
                      inactiveColor: ColorManager.grey,
                      inactiveFillColor: Colors.white,
                      activeFillColor: ColorManager.white,
                      selectedColor: ColorManager.purple,
                      selectedFillColor: ColorManager.grey,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    onCompleted: (submittedCode) {
                      // otpCode = submittedCode;
                      print("Completed");
                    },
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                ),
                const SizedBox(
                  height: AppSize.s25,
                ),
                DefaultTextButton(
                  text: AppStrings.verify,
                  fontWeight: FontWeight.normal,
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      Routes.resetPasswordRoute,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
