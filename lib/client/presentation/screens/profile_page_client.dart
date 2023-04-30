import 'package:flutter/material.dart';
import 'package:solvers/Auth/presentation/widgets/default_form_field.dart';
import 'package:solvers/core/global/resources/strings_manger.dart';
import 'package:solvers/core/global/resources/values_manger.dart';
import 'package:solvers/core/utils/constants.dart';
import 'package:solvers/core/utils/functions.dart';

class ClientProfilePage extends StatelessWidget {
  ClientProfilePage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  // create validation
  final TextEditingController _firstNameEditingController =
      TextEditingController();

  final TextEditingController _lastNameEditingController =
      TextEditingController();

  final TextEditingController _emailEditingController = TextEditingController();

  final TextEditingController _passwordEditingController =
      TextEditingController();

  final TextEditingController _phoneNumberEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: AppSize.s60,
            right: AppSize.s20,
            left: AppSize.s20,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/person_ic.png"),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "username",
                    style: TextStyle(
                      fontSize: 36,
                    ),
                  ),
                ],
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: AppSize.s33,
                    ),
                    DefaultFormField(
                      obscureText: false,
                      hintText: AppStrings.firstNameHint,
                      controller: _firstNameEditingController,
                      type: TextInputType.name,
                      validator: (String? s) {
                        if (s!.length < Constants.three) {
                          return AppStrings.userNameError;
                        }
                        return null;
                      },
                      suffix: Icons.edit,
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
                      suffix: Icons.edit,
                      suffixPressed: () {},
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: AppSize.s12,
                    ),
                    DefaultFormField(
                      obscureText: false,
                      hintText: AppStrings.phoneNumberHint,
                      controller: _phoneNumberEditingController,
                      type: TextInputType.text,
                      validator: (input) =>
                          input!.isValidPhone() ? null : AppStrings.phoneError,
                      suffix: Icons.edit,
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
                      suffix: Icons.edit,
                      suffixPressed: () {},
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: AppSize.s12,
                    ),
                    DefaultFormField(
                      obscureText: false,
                      hintText: AppStrings.passwordHint,
                      controller: _passwordEditingController,
                      type: TextInputType.number,
                      validator: (input) => input!.isValidPassword()
                          ? null
                          : AppStrings.passwordError,
                      suffix: Icons.edit,
                      suffixPressed: () {
                        // TODO
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
