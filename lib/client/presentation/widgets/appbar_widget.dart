import 'package:flutter/material.dart';
import 'package:solvers/client/presentation/widgets/drawer.dart';
import 'package:solvers/core/assets/app_assets.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/global/resources/values_manger.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({Key? key}) : super(key: key);

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
      leading: IconButton(
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            ThreeBlackLinesWidget(),
          ],
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
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
    return Column(
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
    );
  }
}
