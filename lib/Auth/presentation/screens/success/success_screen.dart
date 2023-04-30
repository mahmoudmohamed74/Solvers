import 'package:flutter/material.dart';
import 'package:solvers/core/assets/app_assets.dart';
import 'package:solvers/core/global/resources/strings_manger.dart';
import 'package:solvers/core/global/resources/values_manger.dart';
import 'package:solvers/core/global/resources/color_manager.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: AppSize.inf,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              fit: BoxFit.fitHeight,
              image: AssetImage(
                ImageAssets.successImage,
              ),
            ),
            const SizedBox(
              height: AppSize.s25,
            ),
            Text(
              AppStrings.successfulNewPassword,
              style: TextStyle(
                fontSize: AppSize.s25,
                color: ColorManager.darkGrey,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
