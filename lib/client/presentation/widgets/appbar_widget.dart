import 'package:flutter/material.dart';
import 'package:solvers/core/global/theme/app_color/color_manager.dart';

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
          bottom: Radius.circular(15.0),
        ),
      ),
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ThreeBlackLinesWidget(),
        ],
      ),
      centerTitle: true,
      elevation: 5,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
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

  const ThreeBlackLinesWidget({super.key, this.lineHeight = 3});

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
