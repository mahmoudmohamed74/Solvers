import 'package:flutter/material.dart';
import 'package:solvers/Auth/presentation/widgets/default_text_button.dart';
import 'package:solvers/core/assets/app_assets.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/global/resources/values_manger.dart';

class ClientPaymentDonePage extends StatelessWidget {
  const ClientPaymentDonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
            Image.asset(
              ImageAssets.splashLogo,
              scale: AppSize.s1,
            ),
            Text(
              "Solvers",
              style: TextStyle(
                fontSize: AppSize.s36,
                color: ColorManager.black,
              ),
            ),
            const SizedBox(
              height: AppSize.s90,
            ),
            Image.asset(
              ImageAssets.successImage,
              scale: AppSize.s1,
            ),
            const SizedBox(
              height: AppSize.s30,
            ),
            Text(
              "Payment done\nsuccessfully",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppSize.s36,
                fontWeight: FontWeight.w500,
                color: ColorManager.black,
              ),
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            const SizedBox(
              height: AppSize.s30,
            ),
            DefaultTextButton(
              text: "Home page",
            ),
          ],
        ),
      ),
    );
  }
}
