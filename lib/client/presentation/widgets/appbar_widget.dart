import 'package:flutter/material.dart';
import 'package:solvers/core/assets/app_assets.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/global/resources/values_manger.dart';
import 'package:solvers/core/routes/app_routes.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget({this.isBack = false, Key? key}) : super(key: key);

  bool isBack = false;

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
      leading: isBack
          ? IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Image.asset(
                ImageAssets.back,
                scale: AppSize.s1_5,
              ),
            )
          : const ThreeBlackLinesWidget(),
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
