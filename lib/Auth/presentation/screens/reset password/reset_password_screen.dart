import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solvers/Auth/presentation/widgets/default_form_field.dart';
import 'package:solvers/Auth/presentation/widgets/default_text_button.dart';
import 'package:solvers/core/assets/app_assets.dart';
import 'package:solvers/core/global/resources/strings_manger.dart';
import 'package:solvers/core/global/resources/values_manger.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/utils/functions.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final _formKey = GlobalKey<FormState>(); // create validation

  final TextEditingController _passwordEditingController =
      TextEditingController();

  final TextEditingController _passwordConfirmEditingController =
      TextEditingController();

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
          onPressed: () {},
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
                  height: AppSize.s25,
                ),
                Text(
                  AppStrings.setNewPassword,
                  style: TextStyle(
                    fontSize: AppSize.s30,
                    color: ColorManager.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s25,
                ),
                DefaultFormField(
                  hintText: AppStrings.passwordHint,
                  controller: _passwordEditingController,
                  type: TextInputType.number,
                  validator: (input) => input!.isValidPassword()
                      ? null
                      : AppStrings.passwordError,
                  suffix: Icons.lock_outline_rounded,
                  suffixPressed: () {
                    // TODO
                  },
                ),
                const SizedBox(
                  height: AppSize.s22,
                ),
                DefaultFormField(
                  hintText: AppStrings.confirmPasswordHint,
                  controller: _passwordConfirmEditingController,
                  type: TextInputType.text,
                  validator: (String? s) {
                    if (_passwordEditingController !=
                        _passwordConfirmEditingController) {
                      return AppStrings.passwordConfirmationError;
                    }
                    return null;
                  },
                  suffix: Icons.lock_outline_rounded,
                  suffixPressed: () {
                    // TODO
                  },
                ),
                const SizedBox(
                  height: AppSize.s25,
                ),
                DefaultTextButton(
                  borderColor: ColorManager.primary,
                  backGroundColor: ColorManager.primary,
                  textColor: ColorManager.black,
                  text: AppStrings.confirm,
                  fontWeight: FontWeight.normal,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {}
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
