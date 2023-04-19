// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:solvers/core/global/resources/values_manger.dart';

class DefaultTextButton extends StatelessWidget {
  DefaultTextButton({
    Key? key,
    required this.text,
    required this.textColor,
    required this.backGroundColor,
    required this.borderColor,
    this.onTap,
    this.fontWeight,
  }) : super(key: key);
  String text;
  VoidCallback? onTap;
  Color textColor;
  Color backGroundColor;
  Color borderColor;
  FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s22),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            spreadRadius: AppSize.s2,
            blurRadius: AppSize.s5,
            offset: const Offset(AppSize.s0, AppSize.s3),
          )
        ],
      ),
      child: TextButton(
        onPressed: onTap,
        style: ButtonStyle(
          side: MaterialStateProperty.all(
            BorderSide(
              color: borderColor,
            ),
          ),
          backgroundColor: MaterialStateProperty.all(backGroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s22),
            ),
          ),
        ),
        child: Container(
          height: AppSize.s50,
          width: AppSize.s305,
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontSize: AppSize.s18,
              fontWeight: fontWeight,
              color: textColor,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
      ),
    );
  }
}
