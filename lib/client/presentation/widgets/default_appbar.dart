// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:solvers/core/assets/app_assets.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/global/resources/values_manger.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  DefaultAppBar({
    Key? key,
    required this.leadingIconButton,
  }) : super(key: key);

  final Widget leadingIconButton;

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManager.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(AppSize.s15),
        ),
      ),
      leading: leadingIconButton,
      centerTitle: true,
      elevation: AppSize.s5,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: AppSize.s10,
          ),
          Image.asset(
            ImageAssets.splashLogo,
            scale: AppSize.s4,
          ),
          Text(
            "Solvers",
            style: TextStyle(
              fontSize: AppSize.s16,
              color: ColorManager.black,
            ),
          ),
        ],
      ),
    );
  }
}

class ThreeBlackLinesWidget extends StatelessWidget {
  final double lineHeight;

  const ThreeBlackLinesWidget({super.key, this.lineHeight = AppSize.s3});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: ColorManager.black,
                  borderRadius: BorderRadius.circular(AppSize.s2),
                ),
                height: lineHeight,
                width: AppSize.s20,
              ),
              const SizedBox(height: AppSize.s5),
              Container(
                decoration: BoxDecoration(
                  color: ColorManager.black,
                  borderRadius: BorderRadius.circular(AppSize.s2),
                ),
                height: lineHeight,
                width: AppSize.s13,
              ),
              const SizedBox(height: AppSize.s5),
              Container(
                decoration: BoxDecoration(
                  color: ColorManager.black,
                  borderRadius: BorderRadius.circular(AppSize.s2),
                ),
                height: lineHeight,
                width: AppSize.s20,
              ),
            ],
          ),
        ],
      ),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    );
  }
}
