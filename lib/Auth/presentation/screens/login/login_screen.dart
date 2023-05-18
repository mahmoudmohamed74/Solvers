// ignore_for_file: prefer_final_fields

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvers/Auth/domain/entities/registered_user.dart';
import 'package:solvers/Auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:solvers/Auth/presentation/widgets/default_form_field.dart';
import 'package:solvers/Auth/presentation/widgets/default_snack_bar.dart';
import 'package:solvers/Auth/presentation/widgets/default_text_button.dart';
import 'package:solvers/core/app/app_prefs.dart';
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
  final AppPreferences _appPreferences = sl<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<FirebaseAuthCubit>(context);
    return BlocConsumer<FirebaseAuthCubit, FirebaseAuthState>(
      listener: (context, state) async {
        if (state is LogInSuccessState) {
          // print(state.user);
          if (state.user.emailVerified == true) {
            if (state.userRole == 'technician') {
              Navigator.pushReplacementNamed(
                context,
                Routes.layoutTech,
              );
              await _appPreferences.setIsTechnicianLoggedIn();
            } else if (state.userRole == 'client') {
              Navigator.pushReplacementNamed(
                context,
                Routes.layoutClient,
              );
              await _appPreferences.setIsClientLoggedIn();
            }
          } else {
            Navigator.pushReplacementNamed(
              context,
              Routes.emailVerificationRoute,
            );
          }
        } else if (state is CubitAuthFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            DefaultSnackBar(
              text: Text(
                state.error,
                style: TextStyle(
                  color: ColorManager.white,
                  fontSize: AppSize.s16,
                ),
              ),
              backGroundColor: ColorManager.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
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
                      validator: (input) =>
                          input!.isValidEmail() ? null : AppStrings.emailError,
                      suffix: Icons.mail_outline_rounded,
                      suffixPressed: () {},
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: AppSize.s12,
                    ),
                    DefaultFormField(
                      obscureText: authCubit.isPassword,
                      hintText: AppStrings.passwordHint,
                      controller: _passwordEditingController,
                      type: TextInputType.text,
                      validator: (input) => input!.isValidPassword()
                          ? null
                          : AppStrings.passwordError,
                      suffix: authCubit.suffix,
                      suffixPressed: authCubit.changePasswordVisibility,
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
                    ConditionalBuilder(
                      condition: state is! CubitAuthLoadingState,
                      builder: (context) => DefaultTextButton(
                        text: AppStrings.login,
                        fontWeight: FontWeight.normal,
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            await FirebaseAuthCubit.get(context).logIn(
                              RegisteredUser(
                                email: _emailEditingController.text,
                                password: _passwordEditingController.text,
                              ),
                            );
                          }
                        },
                      ),
                      fallback: (context) => Center(
                        child: CircularProgressIndicator(
                          color: ColorManager.purple,
                        ),
                      ),
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
                          Routes.toggleRoute,
                        );
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
    );
  }
}
