import 'package:flutter/material.dart';
import 'package:solvers/core/assets/app_assets.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/global/resources/strings_manger.dart';
import 'package:solvers/core/global/resources/values_manger.dart';
import 'package:solvers/core/routes/app_routes.dart';

class ToggleScreen extends StatelessWidget {
  const ToggleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: AppSize.s50,
            ),
            const Image(
              fit: BoxFit.fitHeight,
              image: AssetImage(
                ImageAssets.splashLogo,
              ),
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            Text(
              AppStrings.solvers,
              style: TextStyle(
                fontSize: AppSize.s33,
                color: ColorManager.black,
              ),
            ),
            const SizedBox(
              height: AppSize.s30,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
              decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: const BorderRadius.all(
                  Radius.circular(AppSize.s18),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    spreadRadius: AppSize.s2,
                    blurRadius: AppSize.s5,
                    offset: const Offset(AppSize.s0, AppSize.s3),
                  )
                ],
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  const SizedBox(
                    width: AppSize.inf,
                    height: AppSize.s190,
                    child: Padding(
                      padding: EdgeInsets.only(top: AppPadding.p30),
                      child: Text(
                        AppStrings.loginAs,
                        style: TextStyle(
                          fontSize: AppSize.s20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    width: AppSize.inf,
                    height: AppSize.s90,
                    decoration: BoxDecoration(
                      color: ColorManager.selectedItem,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(AppSize.s16),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          spreadRadius: AppSize.s2,
                          blurRadius: AppSize.s5,
                          offset: const Offset(AppSize.s0, AppSize.s3),
                        )
                      ],
                    ),
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateColor.resolveWith(
                          (states) => ColorManager.selectedItem,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          Routes.clientRegisterRoute,
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            AppStrings.individuals,
                            style: TextStyle(
                              color: ColorManager.black,
                              fontSize: AppSize.s20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            AppStrings.needHelp,
                            style: TextStyle(
                              color: ColorManager.black,
                              fontSize: AppSize.s16,
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: AppSize.s50,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
              decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: const BorderRadius.all(
                  Radius.circular(AppSize.s18),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    spreadRadius: AppSize.s2,
                    blurRadius: AppSize.s5,
                    offset: const Offset(AppSize.s0, AppSize.s3),
                  )
                ],
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  const SizedBox(
                    width: AppSize.inf,
                    height: AppSize.s190,
                    child: Padding(
                      padding: EdgeInsets.only(top: AppPadding.p30),
                      child: Text(
                        AppStrings.loginAs,
                        style: TextStyle(
                          fontSize: AppSize.s20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    width: AppSize.inf,
                    height: AppSize.s90,
                    decoration: BoxDecoration(
                      color: ColorManager.selectedItem,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(AppSize.s16),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          spreadRadius: AppSize.s2,
                          blurRadius: AppSize.s5,
                          offset: const Offset(AppSize.s0, AppSize.s3),
                        )
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          Routes.technicianRegisterRoute,
                        );
                      },
                      style: ButtonStyle(
                        overlayColor: MaterialStateColor.resolveWith(
                          (states) => ColorManager.selectedItem,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            AppStrings.technician,
                            style: TextStyle(
                              color: ColorManager.black,
                              fontSize: AppSize.s20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            AppStrings.joinTeam,
                            style: TextStyle(
                              color: ColorManager.black,
                              fontSize: AppSize.s16,
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: AppSize.s50,
            ),
          ],
        ),
      ),
    );
  }
}
