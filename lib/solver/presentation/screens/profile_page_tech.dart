import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvers/Auth/presentation/widgets/default_form_field.dart';
import 'package:solvers/Auth/presentation/widgets/default_snack_bar.dart';
import 'package:solvers/Auth/presentation/widgets/default_text_button.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/global/resources/strings_manger.dart';
import 'package:solvers/core/global/resources/values_manger.dart';
import 'package:solvers/core/utils/constants.dart';
import 'package:solvers/core/utils/functions.dart';
import 'package:solvers/solver/data/requests/update_tech_data_request.dart';
import 'package:solvers/solver/presentation/controller/tech_cubit.dart';
import 'package:solvers/solver/presentation/widgets/skills_form_widget.dart';

class TechProfilePage extends StatefulWidget {
  TechProfilePage({Key? key}) : super(key: key);

  @override
  State<TechProfilePage> createState() => _TechProfilePageState();
}

class _TechProfilePageState extends State<TechProfilePage> {
  final _formKey = GlobalKey<FormState>();
  List<String> updatedSkills = [];
  final _focusNode = FocusScopeNode();

  // create validation
  final TextEditingController _firstNameEditingController =
      TextEditingController();

  final TextEditingController _lastNameEditingController =
      TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();

  final TextEditingController _phoneNumberEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final techCubit = TechCubit.get(context);

    List<String> techSkills = techCubit.techData!.skills;

    return BlocConsumer<TechCubit, TechState>(
      listener: (context, state) {
        if (state is IsFirstNameValid) {
          ScaffoldMessenger.of(context).showSnackBar(
            DefaultSnackbar(
              text: Text(
                state.isValid
                    ? "First Name updated successfully!"
                    : AppStrings.userNameError,
                style: TextStyle(
                  color: ColorManager.white,
                  fontSize: AppSize.s16,
                ),
              ),
              backGroundColor:
                  state.isValid ? ColorManager.green : ColorManager.red,
            ),
          );
        }

        if (state is IsLastNameValid) {
          ScaffoldMessenger.of(context).showSnackBar(
            DefaultSnackbar(
              text: Text(
                state.isValid
                    ? "Last Name updated successfully!"
                    : AppStrings.userNameError,
                style: TextStyle(
                  color: ColorManager.white,
                  fontSize: AppSize.s16,
                ),
              ),
              backGroundColor:
                  state.isValid ? ColorManager.green : ColorManager.red,
            ),
          );
        }
        if (state is IsPhoneNumberValid) {
          ScaffoldMessenger.of(context).showSnackBar(
            DefaultSnackbar(
              text: Text(
                state.isValid
                    ? "Phone Number updated successfully!"
                    : AppStrings.phoneError,
                style: TextStyle(
                  color: ColorManager.white,
                  fontSize: AppSize.s16,
                ),
              ),
              backGroundColor:
                  state.isValid ? ColorManager.green : ColorManager.red,
            ),
          );
        }
      },
      builder: (context, state) {
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
                      Text(
                        techCubit.techData!.firstName,
                        style: const TextStyle(
                          fontSize: 36,
                        ),
                      ),
                    ],
                  ),
                  FocusScope(
                    node: _focusNode,
                    child: Form(
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
                            hintText: techCubit.techData!.firstName,
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
                            onTap: () => techCubit.onFirstNameFieldClicked(),
                          ),
                          const SizedBox(
                            height: AppSize.s12,
                          ),
                          DefaultFormField(
                            hintText: techCubit.techData!.lastName,
                            controller: _lastNameEditingController,
                            type: TextInputType.name,
                            validator: (String? s) {
                              if (s!.length < Constants.three) {
                                return AppStrings.userNameError;
                              }
                              return null;
                            },
                            obscureText: false,
                            suffix: Icons.edit,
                            suffixPressed: () {},
                            onTap: () => techCubit.onLastNameFieldClicked(),
                          ),
                          const SizedBox(
                            height: AppSize.s12,
                          ),
                          DefaultFormField(
                            obscureText: false,
                            hintText: techCubit.techData!.phoneNumber,
                            controller: _phoneNumberEditingController,
                            type: TextInputType.text,
                            validator: (input) => input!.isValidPhone()
                                ? null
                                : AppStrings.phoneError,
                            suffix: Icons.edit,
                            suffixPressed: () {},
                            onTap: () => techCubit.onPhoneFieldClicked(),
                          ),
                          const SizedBox(
                            height: AppSize.s12,
                          ),
                          DefaultFormField(
                            isClickable: false,
                            obscureText: false,
                            hintText: techCubit.techData!.email,
                            controller: _emailEditingController,
                            type: TextInputType.emailAddress,
                            validator: (value) {
                              return null;
                            },
                            suffixPressed: () {},
                          ),
                          const SizedBox(
                            height: AppSize.s12,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 30,
                            ),
                            child: SkillsForm(
                              skills: techSkills,
                              onSkillsChanged: (skills) => setState(() {
                                techSkills = skills;
                                updatedSkills = skills;
                                print("update: $updatedSkills");
                              }),
                            ),
                          ),
                          const SizedBox(
                            height: AppSize.s12,
                          ),
                          ConditionalBuilder(
                            condition: state is! UpdateTechDataLoadingState,
                            builder: (context) {
                              return DefaultTextButton(
                                text: "Update",
                                onTap: () async {
                                  await techCubit.updateTechData(
                                    UpdateTechDataRequest(
                                      techId: techCubit.techId!,
                                      firstName: await techCubit.validFirstName(
                                        _firstNameEditingController.text,
                                      ),
                                      lastName: await techCubit.validLastName(
                                        _lastNameEditingController.text,
                                      ),
                                      phoneNumber:
                                          await techCubit.validPhoneNumber(
                                        _phoneNumberEditingController.text,
                                      ),
                                      skills: updatedSkills,
                                    ),
                                    context,
                                  );
                                  _firstNameEditingController.clear();
                                  _lastNameEditingController.clear();
                                  _phoneNumberEditingController.clear();
                                  _focusNode.unfocus();
                                },
                              );
                            },
                            fallback: (context) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: ColorManager.purple,
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: AppSize.s12,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
