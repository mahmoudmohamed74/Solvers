import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:solvers/Auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:solvers/Auth/presentation/widgets/default_snack_bar.dart';
import 'package:solvers/Auth/presentation/widgets/default_text_button.dart';
import 'package:solvers/client/presentation/widgets/appbar_widget.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/global/resources/strings_manger.dart';
import 'package:solvers/core/global/resources/values_manger.dart';
import 'package:solvers/core/routes/app_routes.dart';
import 'package:solvers/solver/data/models/offer_model.dart';
import 'package:solvers/solver/presentation/controller/tech_cubit.dart';

import '../../../core/utils/constants.dart';

class TechCreateOfferPage extends StatelessWidget {
  final String? orderDocId;
  final String? orderId;

  TechCreateOfferPage({
    Key? key,
    this.orderId,
    this.orderDocId,
  }) : super(key: key);

  final TextEditingController _textarea = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _earnestPrice = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    final authCubit = FirebaseAuthCubit.get(context).techData!;
    var dateTime = DateTime.now();
    var dateTimeFormatted =
        DateFormat('dd/MM/yyyy HH:mm:ss a').format(dateTime);
    return BlocConsumer<TechCubit, TechState>(
      listener: (context, state) async {
        if (state is CreateOfferSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            DefaultSnackbar(
              text: Text(
                AppStrings.successFullOffer,
                style: TextStyle(
                  color: ColorManager.white,
                  fontSize: AppSize.s16,
                ),
              ),
              backGroundColor: ColorManager.green,
            ),
          );

          await Future.delayed(const Duration(seconds: 2));
          navigator.pushReplacementNamed(
            Routes.layoutTech,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBarWidget(
            isBack: true,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 80,
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Create offer",
                        style: TextStyle(
                          fontSize: AppSize.s36,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Request number: ${orderId!.substring(0, 8)}",
                        style: const TextStyle(
                          fontSize: AppSize.s20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s40,
                    ),
                    const Text(
                      "Price (In range between 10 SR -50 SR)",
                      style: TextStyle(
                        fontSize: AppSize.s20,
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s10,
                    ),
                    Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(8),
                      child: TextFormField(
                        controller: _price,
                        keyboardType: TextInputType.number,
                        validator: (String? s) {
                          if (s!.length < Constants.two) {
                            return "Price is required";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: ColorManager.primary,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorManager.primary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorManager.purple,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 10.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s40,
                    ),
                    const Text(
                      "Earnest (30% of the total price)",
                      style: TextStyle(
                        fontSize: AppSize.s20,
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s10,
                    ),
                    Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(8),
                      child: TextFormField(
                        controller: _earnestPrice,
                        keyboardType: TextInputType.number,
                        validator: (String? s) {
                          if (s!.length < Constants.two) {
                            return "Earnest is required";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: ColorManager.primary,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorManager.primary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorManager.purple,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 10.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s30,
                    ),
                    const Text(
                      "Any additional information (Optional)",
                      style: TextStyle(
                        fontSize: AppSize.s20,
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s10,
                    ),
                    TextFormField(
                      controller: _textarea,
                      textInputAction: TextInputAction.newline,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: "Your text here...",
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
                    const SizedBox(
                      height: AppSize.s30,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: DefaultTextButton(
                        text: "Send",
                        onTap: () {
                          // if (_formKey.currentState!.validate()) {}
                          TechCubit.get(context).createOffer(
                            OfferModel(
                              techName: authCubit.firstName,
                              techId: authCubit.techId,
                              price: "50",
                              earnest: "30",
                              offerDescription: "how can i help u",
                              offerDate: dateTimeFormatted.toString(),
                            ),
                            orderDocId!,
                          );
                        },
                      ),
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
