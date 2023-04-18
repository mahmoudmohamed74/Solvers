import 'package:flutter/material.dart';
import 'package:solvers/client/presentation/widgets/drawer.dart';
import 'package:solvers/core/global/theme/app_color/color_manager.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManager.white,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ThreeBlackLinesWidget(),
        ],
      ),
      centerTitle: true,
      elevation: 5,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/splash_logo.png',
            scale: 4,
          ),
          Text(
            "Solvers",
            style: TextStyle(
              fontSize: 16,
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

  ThreeBlackLinesWidget({this.lineHeight = 3});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorManager.black,
              borderRadius: BorderRadius.circular(2),
            ),
            height: lineHeight,
            width: 20,
          ),
          const SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
              color: ColorManager.black,
              borderRadius: BorderRadius.circular(2),
            ),
            height: lineHeight,
            width: 13,
          ),
          const SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
              color: ColorManager.black,
              borderRadius: BorderRadius.circular(2),
            ),
            height: lineHeight,
            width: 20,
          ),
        ],
      ),
      onTap: () {
        print("object");
      },
    );
  }
}
