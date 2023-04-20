// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvers/Auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:solvers/Auth/presentation/widgets/default_form_field.dart';
import 'package:solvers/Auth/presentation/widgets/default_text_button.dart';
import 'package:solvers/core/assets/app_assets.dart';
import 'package:solvers/core/global/resources/strings_manger.dart';
import 'package:solvers/core/global/resources/values_manger.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/routes/app_routes.dart';
import 'package:solvers/core/services/services_locator.dart';
import 'package:solvers/core/utils/functions.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>(); // create validation

  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<FirebaseAuthCubit>(),
      child: BlocConsumer<FirebaseAuthCubit, FirebaseAuthState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = FirebaseAuthCubit.get(context);
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
                            AppStrings.login,
                            style: TextStyle(
                              fontSize: AppSize.s30,
                              color: ColorManager.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      DefaultFormField(
                        hintText: AppStrings.emailHint,
                        controller: _emailEditingController,
                        type: TextInputType.emailAddress,
                        validator: (input) => input!.isValidEmail()
                            ? null
                            : AppStrings.emailError,
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
                        suffix: Icons.remove_red_eye_rounded,
                        suffixPressed: () {
                          // TODO
                        },
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: AppPadding.p20,
                          ),
                          child: TextButton(
                            child: Text(
                              AppStrings.forgotPassword,
                              style: TextStyle(
                                fontSize: AppSize.s18,
                                color: ColorManager.darkPrimary,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                context,
                                Routes.forgotPasswordRoute,
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s12,
                      ),
                      DefaultTextButton(
                        text: AppStrings.login,
                        fontWeight: FontWeight.normal,
                        onTap: () async {
                          // if (_formKey.currentState!.validate()) {

                          // }
                          // await cubit.signOut(
                          //   userId: "7rt0Frki1Wem8SBtiv8ygyeKRrO2",
                          // );
                          // await cubit.logIn(
                          //   RegisteredUser(
                          //     email: "volt@gmail.com",
                          //     password: "123456789",
                          //   ),
                          // );
                          // await cubit.signUp(RegisteredUser(
                          //   email: "volt@gmail.com",
                          //   password: "a123456789",
                          // ));
                        },
                      ),
                      const SizedBox(
                        height: AppSize.s18,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: AppPadding.p29,
                          ),
                          child: Text(
                            AppStrings.doNotHaveAccount,
                            style: TextStyle(
                              fontSize: AppSize.s18,
                              color: ColorManager.darkPrimary,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s12,
                      ),
                      DefaultTextButton(
                        text: AppStrings.signUp,
                        fontWeight: FontWeight.normal,
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            Routes.technicianRegisterRoute,
                          );
                          // if (_formKey.currentState!.validate()) {
                          //   Navigator.pushReplacementNamed(
                          //     context,
                          //     Routes.individualRegisterRoute,
                          //   );
                          // }
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
        },
      ),
    );
  }
}
