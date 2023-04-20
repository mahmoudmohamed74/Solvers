import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solvers/Auth/presentation/widgets/default_form_field.dart';
import 'package:solvers/Auth/presentation/widgets/default_text_button.dart';
import 'package:solvers/core/assets/app_assets.dart';
import 'package:solvers/core/global/resources/strings_manger.dart';
import 'package:solvers/core/global/resources/values_manger.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/routes/app_routes.dart';
import 'package:solvers/core/utils/functions.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final _formKey = GlobalKey<FormState>(); // create validation

  final TextEditingController _phoneNumberEditingController =
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
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                Text(
                  AppStrings.enterPhoneNumber,
                  style: TextStyle(
                    fontSize: AppSize.s33,
                    color: ColorManager.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s20,
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
                  height: AppSize.s20,
                ),
                DefaultTextButton(
                  text: AppStrings.next,
                  fontWeight: FontWeight.normal,
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      Routes.phoneVerificationRoute,
                    );
                    // if (_formKey.currentState!.validate()) {}
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
  }
}
