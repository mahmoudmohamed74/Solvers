// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:solvers/core/assets/app_assets.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  String? title;
  final double height;
  DefaultAppBar({
    required this.title,
    this.height = kToolbarHeight,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      titleSpacing: 20.0,
      backgroundColor: Colors.transparent,
      title: Text(
        title!,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 24,
        ),
      ),
      leading: GestureDetector(
        child: Image.asset(
          ImageAssets.splashLogo,
        ),
        onTap: () {},
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
