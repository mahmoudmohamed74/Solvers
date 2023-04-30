import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solvers/Auth/presentation/widgets/default_form_field.dart';
import 'package:solvers/Auth/presentation/widgets/default_snack_bar.dart';
import 'package:solvers/Auth/presentation/widgets/default_text_button.dart';
import 'package:solvers/core/assets/app_assets.dart';
import 'package:solvers/core/global/resources/strings_manger.dart';
import 'package:solvers/core/global/resources/values_manger.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/routes/app_routes.dart';
import 'package:solvers/core/utils/functions.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailEditingController = TextEditingController();

  Future<void> resetPassword(context) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailEditingController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        DefaultSnackbar(
          text: Text(
            AppStrings.linkSentToEmail,
            style: TextStyle(
              color: ColorManager.white,
              fontSize: AppSize.s16,
            ),
          ),
          backGroundColor: ColorManager.green,
        ),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        DefaultSnackbar(
          text: Text(
            e.message!,
            style: TextStyle(
              color: ColorManager.white,
              fontSize: AppSize.s16,
            ),
          ),
          backGroundColor: ColorManager.red,
        ),
      );
    }
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
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              Routes.userLoginRoute,
            );
          },
          icon: Icon(
            Icons.arrow_back,
            color: ColorManager.darkPrimary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  fit: BoxFit.fitHeight,
                  height: AppSize.s150,
                  image: AssetImage(
                    ImageAssets.resetPasswordImage,
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
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s20,
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
                DefaultFormField(
                  hintText: AppStrings.emailHint,
                  controller: _emailEditingController,
                  type: TextInputType.text,
                  validator: (input) =>
                      input!.isValidEmail() ? null : AppStrings.emailError,
                  suffix: Icons.mail_outline_rounded,
                  suffixPressed: () {},
                  obscureText: false,
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                DefaultTextButton(
                  text: AppStrings.next,
                  fontWeight: FontWeight.normal,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      resetPassword(context);
                    }
                  },
                ),
                const SizedBox(
                  height: AppSize.s18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
