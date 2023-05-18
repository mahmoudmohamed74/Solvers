import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvers/Auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:solvers/Auth/presentation/widgets/default_snack_bar.dart';
import 'package:solvers/Auth/presentation/widgets/default_text_button.dart';
import 'package:solvers/core/assets/app_assets.dart';
import 'package:solvers/core/global/resources/strings_manger.dart';
import 'package:solvers/core/global/resources/values_manger.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/routes/app_routes.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<FirebaseAuthCubit>(context);
    return Scaffold(
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
                  AppStrings.verifyYourEmail,
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
                  AppStrings.otpSentToEmail,
                  style: TextStyle(
                    fontSize: AppSize.s20,
                    color: ColorManager.darkGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: AppSize.s25,
                ),
                DefaultTextButton(
                  text: AppStrings.login,
                  fontWeight: FontWeight.normal,
                  onTap: () async {
                    Navigator.pushReplacementNamed(
                      context,
                      Routes.userLoginRoute,
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () async {
                      authCubit.user!.sendEmailVerification();
                      ScaffoldMessenger.of(context).showSnackBar(
                        DefaultSnackBar(
                          text: Text(
                            AppStrings.reSendMessage,
                            style: TextStyle(
                              color: ColorManager.white,
                              fontSize: AppSize.s16,
                            ),
                          ),
                          backGroundColor: ColorManager.grey,
                        ),
                      );
                    },
                    child: Text(
                      AppStrings.reSend,
                      style: TextStyle(
                        color: ColorManager.purple,
                        fontSize: AppSize.s16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
