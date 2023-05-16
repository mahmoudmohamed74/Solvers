import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvers/Auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:solvers/Auth/presentation/widgets/default_form_field.dart';
import 'package:solvers/Auth/presentation/widgets/default_snack_bar.dart';
import 'package:solvers/Auth/presentation/widgets/default_text_button.dart';
import 'package:solvers/client/data/requests/update_client_data_request.dart';
import 'package:solvers/client/presentation/controller/client_cubit.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/global/resources/strings_manger.dart';
import 'package:solvers/core/global/resources/values_manger.dart';
import 'package:solvers/core/utils/constants.dart';
import 'package:solvers/core/utils/functions.dart';

class ClientProfilePage extends StatelessWidget {
  ClientProfilePage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
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
    // final authCubit = BlocProvider.of<FirebaseAuthCubit>(context);
    final clientCubit = ClientCubit.get(context);

    return BlocConsumer<ClientCubit, ClientState>(
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
                      Text(
                        clientCubit.clientData!.firstName,
                        style: const TextStyle(
                          fontSize: 36,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
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
                                hintText: clientCubit.clientData!.firstName,
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
                                onTap: () =>
                                    clientCubit.onFirstNameFieldClicked(),
                              ),
                              const SizedBox(
                                height: AppSize.s12,
                              ),
                              DefaultFormField(
                                hintText: clientCubit.clientData!.lastName,
                                controller: _lastNameEditingController,
                                type: TextInputType.name,
                                validator: (String? s) {
                                  if (s!.length < Constants.three) {
                                    return AppStrings.userNameError;
                                  }
                                  return null;
                                },
                                suffix: Icons.edit,
                                obscureText: false,
                                suffixPressed: () {},
                                onTap: () {
                                  clientCubit.onLastNameFieldClicked();
                                },
                              ),
                              const SizedBox(
                                height: AppSize.s12,
                              ),
                              DefaultFormField(
                                obscureText: false,
                                hintText: clientCubit.clientData!.phoneNumber,
                                controller: _phoneNumberEditingController,
                                type: TextInputType.text,
                                validator: (input) => input!.isValidPhone()
                                    ? null
                                    : AppStrings.phoneError,
                                suffix: Icons.edit,
                                suffixPressed: () {},
                                onTap: () => clientCubit.onPhoneFieldClicked(),
                              ),
                              const SizedBox(
                                height: AppSize.s12,
                              ),
                              DefaultFormField(
                                hintText: clientCubit.clientData!.email,
                                controller: _emailEditingController,
                                type: TextInputType.emailAddress,
                                validator: (value) {
                                  return null;
                                },
                                suffixPressed: () {},
                                obscureText: false,
                                isClickable: false,
                              ),
                              const SizedBox(
                                height: AppSize.s12,
                              ),
                              ConditionalBuilder(
                                condition:
                                    state is! UpdateClientDataLoadingState,
                                builder: (context) {
                                  return DefaultTextButton(
                                    text: "Update",
                                    fontWeight: FontWeight.normal,
                                    onTap: () async {
                                      await clientCubit.updateClientData(
                                        UpdateClientDataRequest(
                                          clientId: clientCubit.clientId!,
                                          firstName:
                                              await clientCubit.validFirstName(
                                            _firstNameEditingController.text,
                                          ),
                                          lastName:
                                              await clientCubit.validLastName(
                                            _lastNameEditingController.text,
                                          ),
                                          phoneNumber: await clientCubit
                                              .validPhoneNumber(
                                            _phoneNumberEditingController.text,
                                          ),
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
                            ],
                          ),
                        ),
                      ),
                    ],
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
