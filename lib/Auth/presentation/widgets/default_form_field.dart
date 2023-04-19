// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:solvers/core/global/resources/values_manger.dart';
import 'package:solvers/core/global/resources/color_manager.dart';

class DefaultFormField extends StatelessWidget {
  DefaultFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.onChanged,
    this.obscureText = false,
    required this.controller,
    required this.type,
    this.suffix,
    this.suffixPressed,
    this.navigator,
    required this.validator,
  });
  Function(String)? onChanged;
  String? hintText;
  String? labelText;
  IconData? suffix;
  TextEditingController controller;
  TextInputType? type;
  Function? suffixPressed;
  Function? navigator;
  String? Function(String? val)? validator;
  bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p5,
        horizontal: AppPadding.p28,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller,
            keyboardType: type,
            obscureText: obscureText!,
            validator: validator,
            onChanged: onChanged,
            style: const TextStyle(fontSize: AppSize.s20),
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: TextStyle(
                color: ColorManager.darkGrey,
                fontSize: AppSize.s14,
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                color: ColorManager.grey,
                fontSize: AppSize.s16,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  suffix,
                  size: AppSize.s25,
                  color: ColorManager.black,
                ),
                onPressed: () {
                  suffixPressed!();
                },
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: AppPadding.p10,
                horizontal: AppPadding.p5,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: ColorManager.purple,
                ),
              ),

              // focusedBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(AppSize.s12),
              //   borderSide: BorderSide(
              //     color: ColorManager.primary,
              //   ),
              // ),

              // errorBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(AppSize.s12),
              //   borderSide: BorderSide(
              //     width: AppSize.s1_5,
              //     color: ColorManager.error,
              //   ),
              // ),
              // focusedErrorBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(AppSize.s12),
              //   borderSide: BorderSide(
              //     width: AppSize.s1_5,
              //     color: ColorManager.error,
              //   ),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
