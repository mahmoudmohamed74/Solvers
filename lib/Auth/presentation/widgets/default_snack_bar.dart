import 'package:flutter/material.dart';
import 'package:solvers/core/utils/constants.dart';

class DefaultSnackbar extends SnackBar {
  Color? backGroundColor;
  Widget? text;
  DefaultSnackbar({
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
