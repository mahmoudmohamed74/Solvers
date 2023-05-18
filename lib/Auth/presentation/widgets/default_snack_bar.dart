import 'package:flutter/material.dart';
import 'package:solvers/core/utils/constants.dart';

class DefaultSnackBar extends SnackBar {
  final Color? backGroundColor;
  final Widget? text;
  DefaultSnackBar({
    Key? key,
    required this.text,
    required this.backGroundColor,
  }) : super(
          key: key,
          content: text!,
          duration: const Duration(seconds: Constants.three),
          backgroundColor: backGroundColor,
          behavior: SnackBarBehavior.floating,
        );
}
