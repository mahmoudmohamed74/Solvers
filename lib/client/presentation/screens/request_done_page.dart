import 'package:flutter/material.dart';
import 'package:solvers/Auth/presentation/widgets/default_text_button.dart';
import 'package:solvers/core/assets/app_assets.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/global/resources/values_manger.dart';
import 'package:solvers/core/routes/app_routes.dart';

class ClientRequestDonePage extends StatelessWidget {
  final String? orderId;
  const ClientRequestDonePage({
    Key? key,
    this.orderId,
  }) : super(key: key);

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
              height: AppSize.s40,
            ),
            Image.asset(
              ImageAssets.successImage,
              scale: AppSize.s1,
            ),
            const SizedBox(
              height: AppSize.s30,
            ),
            Text(
              "Solvers are here to solve your\nproblem",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppSize.s24,
                fontWeight: FontWeight.w500,
                color: ColorManager.black,
              ),
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            Text(
              "Request number",
              style: TextStyle(
                fontSize: AppSize.s20,
                fontWeight: FontWeight.w500,
                color: ColorManager.black,
              ),
            ),
            Text(
              orderId!.substring(0, 8),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppSize.s20,
                fontWeight: FontWeight.w500,
                color: ColorManager.black,
              ),
            ),
            const SizedBox(
              height: AppSize.s30,
            ),
            DefaultTextButton(
              text: "Done",
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  Routes.layoutClient,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
