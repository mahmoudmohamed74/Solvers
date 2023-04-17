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
    // required this.icon,
    this.onTap,
    // this.width,
    // this.height,
    this.fontWeight,
  }) : super(key: key);
  String text;
  // Widget icon;
  VoidCallback? onTap;
  // double? width;
  // double? height;
  Color textColor;
  Color backGroundColor;
  Color borderColor;
  FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
        // shadowColor: ,
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
    );
    // OutlinedButton.icon(
    //   icon: icon,
    //   onPressed: onTap,
    //   label: Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Expanded(
    //         child: Padding(
    //           padding: const EdgeInsetsDirectional.only(end: AppPadding.p35),
    //           child: Text(
    //             textAlign: TextAlign.center,
    //             text,
    //             style: TextStyle(
    //               fontSize: AppSize.s18,
    //               fontWeight: fontWeight,
    //               color: textColor,
    //               fontStyle: FontStyle.normal,
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    //   style: ButtonStyle(
    //     side: MaterialStateProperty.all(
    //       BorderSide(
    //         color: borderColor,
    //       ),
    //     ),
    //     backgroundColor: MaterialStateProperty.all(backGroundColor),
    //     shape: MaterialStateProperty.all(
    //       RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(AppSize.s8),
    //       ),
    //     ),
    //   ),
    // );
  }
}
