import 'package:flutter/material.dart';
import 'package:solvers/Auth/presentation/widgets/default_form_field.dart';
import 'package:solvers/Auth/presentation/widgets/default_text_button.dart';
import 'package:solvers/Auth/presentation/widgets/horizontal_or_line.dart';
import 'package:solvers/core/assets/app_assets.dart';
import 'package:solvers/core/global/resources/strings_manger.dart';
import 'package:solvers/core/global/resources/values_manger.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/utils/constants.dart';
import 'package:solvers/core/utils/functions.dart';

class ClientRegisterScreen extends StatelessWidget {
  ClientRegisterScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  // create validation
  final TextEditingController _firstNameEditingController =
      TextEditingController();

  final TextEditingController _lastNameEditingController =
      TextEditingController();

  final TextEditingController _emailEditingController = TextEditingController();

  final TextEditingController _passwordEditingController =
      TextEditingController();

  final TextEditingController _passwordConfirmEditingController =
      TextEditingController();

  final TextEditingController _phoneNumberEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: AppSize.s65,
                ),
                const Image(
                  fit: BoxFit.fitHeight,
                  height: AppSize.s150,
                  image: AssetImage(
                    ImageAssets.splashLogo,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: AppPadding.p28,
                      bottom: AppPadding.p14,
                    ),
                    child: Text(
                      AppStrings.individualsLogin,
                      style: TextStyle(
                        fontSize: AppSize.s25,
                        color: ColorManager.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                DefaultFormField(
                  hintText: AppStrings.firstNameHint,
                  controller: _firstNameEditingController,
                  type: TextInputType.name,
                  validator: (String? s) {
                    if (s!.length < Constants.three) {
                      return AppStrings.userNameError;
                    }
                    return null;
                  },
                  suffix: Icons.person_outline_rounded,
                  suffixPressed: () {},
                ),
                const SizedBox(
                  height: AppSize.s12,
                ),
                DefaultFormField(
                  hintText: AppStrings.lastNameHint,
                  controller: _lastNameEditingController,
                  type: TextInputType.name,
                  validator: (String? s) {
                    if (s!.length < Constants.three) {
                      return AppStrings.userNameError;
                    }
                    return null;
                  },
                  suffix: Icons.person_outline_rounded,
                  suffixPressed: () {},
                ),
                const SizedBox(
                  height: AppSize.s12,
                ),
                DefaultFormField(
                  hintText: AppStrings.phoneNumberHint,
                  controller: _phoneNumberEditingController,
                  type: TextInputType.text,
                  validator: (input) =>
                      input!.isValidPhone() ? null : AppStrings.phoneError,
                  suffix: Icons.phone_iphone_outlined,
                  suffixPressed: () {},
                ),
                const SizedBox(
                  height: AppSize.s12,
                ),
                DefaultFormField(
                  hintText: AppStrings.emailHint,
                  controller: _emailEditingController,
                  type: TextInputType.emailAddress,
                  validator: (input) =>
                      input!.isValidEmail() ? null : AppStrings.emailError,
                  suffix: Icons.mail_outline_rounded,
                  suffixPressed: () {},
                ),
                const SizedBox(
                  height: AppSize.s12,
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
                  height: AppSize.s12,
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
                  height: AppSize.s20,
                ),
                DefaultTextButton(
                  text: AppStrings.signUp,
                  fontWeight: FontWeight.normal,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                ),
                const HorizontalOrLine(
                  label: AppStrings.or,
                  height: AppSize.s60,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: AppPadding.p29,
                    ),
                    child: Text(
                      AppStrings.haveAccount,
                      style: TextStyle(
                        fontSize: AppSize.s18,
                        color: ColorManager.darkPrimary,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s18,
                ),
                DefaultTextButton(
                  text: AppStrings.signIn,
                  fontWeight: FontWeight.normal,
                  onTap: () {
                    // Navigator.pushReplacementNamed(
                    //   context,
                    //   Routes.technicianRegisterRoute,
                    // );
                    // if (_formKey.currentState!.validate()) {}
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
