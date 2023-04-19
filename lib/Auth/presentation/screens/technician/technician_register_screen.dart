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

  bool isChecked = false;

  final List<String> _selectedItems = [];

  String? _selectedItem;

  final List<String> _items = [
    'Writing',
    'Programming',
    'Technology',
    'Networking',
    'Design',
  ];

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
                SizedBox(
                  width: 250,
                  // height: 100,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      hintText: AppStrings.skills,
                      hintStyle: TextStyle(
                        color: ColorManager.grey,
                        fontSize: AppSize.s16,
                        fontWeight: FontWeight.normal,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: AppPadding.p20,
                        horizontal: AppPadding.p10,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSize.s12),
                        borderSide: BorderSide(
                          color: ColorManager.purple,
                          width: AppSize.s1_5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSize.s12),
                        borderSide: BorderSide(
                          color: ColorManager.purple,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSize.s12),
                        borderSide: BorderSide(
                          width: AppSize.s1_5,
                          color: ColorManager.error,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSize.s12),
                        borderSide: BorderSide(
                          width: AppSize.s1_5,
                          color: ColorManager.error,
                        ),
                      ),
                    ),
                    value: _selectedItem,
                    items: _items.map((item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: CheckboxListTile(
                          title: Text(item),
                          value: _selectedItems.contains(item),
                          activeColor: ColorManager.purple,
                          onChanged: (value) {
                            setState(() {
                              if (!_selectedItems.contains(item)) {
                                _selectedItems.add(item);
                                _selectedItem = item;
                                isChecked = value!;
                                print(_selectedItems);
                                print(_selectedItem);
                                print(isChecked);
                              } else {
                                _selectedItems.remove(item);
                                _selectedItem = item;
                                isChecked = value!;
                                print(_selectedItems);
                                print(_selectedItem);
                                print(isChecked);
                              }
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedItem = value;
                        // print(_selectedItem);
                      });
                    },
                    validator: (value) {
                      if (_selectedItems.isEmpty) {
                        return 'Please select at least one item';
                      }
                      return null;
                    },
                    isExpanded: true,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                DefaultTextButton(
                  borderColor: ColorManager.primary,
                  backGroundColor: ColorManager.primary,
                  textColor: ColorManager.black,
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
                  borderColor: ColorManager.primary,
                  backGroundColor: ColorManager.primary,
                  textColor: ColorManager.black,
                  text: AppStrings.signIn,
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
