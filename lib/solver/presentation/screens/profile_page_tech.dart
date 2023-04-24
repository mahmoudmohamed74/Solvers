import 'package:flutter/material.dart';
import 'package:solvers/Auth/presentation/widgets/default_form_field.dart';
import 'package:solvers/core/global/resources/strings_manger.dart';
import 'package:solvers/core/global/resources/values_manger.dart';
import 'package:solvers/core/utils/constants.dart';
import 'package:solvers/core/utils/functions.dart';
import 'package:solvers/solver/presentation/widgets/skills_form_widget.dart';

class TechProfilePage extends StatefulWidget {
  TechProfilePage({Key? key}) : super(key: key);

  @override
  State<TechProfilePage> createState() => _TechProfilePageState();
}

class _TechProfilePageState extends State<TechProfilePage> {
  List<String> _skills = ['Flutter', 'Dart', 'Firebase'];
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
            top: AppSize.s20,
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
                    "tech name",
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: AppSize.s33,
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
                      suffix: Icons.edit,
                      suffixPressed: () {
                        // TODO
                      },
                    ),
                    const SizedBox(
                      height: AppSize.s12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                      ),
                      child: SkillsForm(
                        skills: _skills,
                        onSkillsChanged: (skills) =>
                            setState(() => _skills = skills),
                      ),
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
