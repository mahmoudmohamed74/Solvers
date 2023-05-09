import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvers/Auth/data/models/tech_model.dart';
import 'package:solvers/Auth/domain/entities/registered_user.dart';
import 'package:solvers/Auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:solvers/Auth/presentation/widgets/default_form_field.dart';
import 'package:solvers/Auth/presentation/widgets/default_snack_bar.dart';
import 'package:solvers/Auth/presentation/widgets/default_text_button.dart';
import 'package:solvers/Auth/presentation/widgets/horizontal_or_line.dart';
import 'package:solvers/Auth/presentation/widgets/multi_drop_down%20_button.dart';
import 'package:solvers/core/assets/app_assets.dart';
import 'package:solvers/core/global/resources/strings_manger.dart';
import 'package:solvers/core/global/resources/values_manger.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/routes/app_routes.dart';
import 'package:solvers/core/utils/constants.dart';
import 'package:solvers/core/utils/functions.dart';

class TechnicianRegisterScreen extends StatefulWidget {
  const TechnicianRegisterScreen({super.key});

  @override
  State<TechnicianRegisterScreen> createState() =>
      _TechnicianRegisterScreenState();
}

class _TechnicianRegisterScreenState extends State<TechnicianRegisterScreen> {
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
  final TextEditingController _experienceEditingController =
      TextEditingController();

  List<String> _selectedItems = [];

  final List<String> _items = [
    'Writing',
    'Flutter',
    'Programming',
    'Backup',
    'Technology',
    'Network',
    'Networking',
    'Dart',
    'Design',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FirebaseAuthCubit, FirebaseAuthState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          FirebaseAuthCubit.get(context).createTech(
            TechModel(
              firstName: _firstNameEditingController.text,
              lastName: _lastNameEditingController.text,
              email: _emailEditingController.text,
              techId: state.user.uid,
              phoneNumber: _phoneNumberEditingController.text,
              experience: _experienceEditingController.text,
              skills: _selectedItems,
            ),
          );
          if (state.user.emailVerified == true) {
            Navigator.pushReplacementNamed(
              context,
              Routes.userLoginRoute,
            );
          } else {
            Navigator.pushReplacementNamed(
              context,
              Routes.emailVerificationRoute,
            );
          }
        } else if (state is CubitAuthFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            DefaultSnackbar(
              text: Text(state.error),
              backGroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
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
                          AppStrings.technicianLogin,
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
                      obscureText: false,
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
                      obscureText: false,
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
                      obscureText: false,
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
                      obscureText: false,
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
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: AppSize.s12,
                    ),
                    DefaultFormField(
                      hintText: AppStrings.confirmPasswordHint,
                      controller: _passwordConfirmEditingController,
                      type: TextInputType.text,
                      validator: (String? s) {
                        if (_passwordEditingController.text !=
                            _passwordConfirmEditingController.text) {
                          return AppStrings.passwordConfirmationError;
                        }
                        return null;
                      },
                      suffix: Icons.lock_outline_rounded,
                      suffixPressed: () {
                        // TODO
                      },
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    SizedBox(
                      width: 250,
                      child: MultiDropDownButtonWidget(
                        items: _items,
                        title: AppStrings.skills,
                        onSelectionChanged: (selectedItems) {
                          setState(() {
                            _selectedItems = selectedItems;
                            print("selected items ${_selectedItems}");
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: AppMargin.m20,
                      ),
                      child: TextFormField(
                        controller: _experienceEditingController,
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        maxLines: 3,
                        validator: (String? s) {
                          if (s!.length < Constants.three) {
                            return AppStrings.experienceError;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: AppStrings.experience,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorManager.grey,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorManager.purple,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    DefaultTextButton(
                      text: AppStrings.signUp,
                      fontWeight: FontWeight.normal,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          FirebaseAuthCubit.get(context).signUp(
                            RegisteredUser(
                              email: _emailEditingController.text,
                              password: _passwordEditingController.text,
                            ),
                          );
                        }
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
                        Navigator.pushReplacementNamed(
                          context,
                          Routes.userLoginRoute,
                        );
                      },
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
