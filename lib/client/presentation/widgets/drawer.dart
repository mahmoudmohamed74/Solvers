import 'package:flutter/material.dart';
import 'package:solvers/core/global/theme/app_color/color_manager.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
        color: ColorManager.grey,
      ),
      height: 350.0,
      width: 200,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
        child: Drawer(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
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
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 180,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.help_outlined,
                        color: ColorManager.grey,
                      ),
                      title: Text(
                        'Help',
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorManager.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {},
                      splashColor: ColorManager.primary,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.phone_enabled_outlined,
                        color: ColorManager.grey,
                      ),
                      title: Text(
                        'Content us',
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorManager.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {},
                      splashColor: ColorManager.darkPrimary,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.logout_outlined,
                        color: ColorManager.grey,
                      ),
                      title: Text(
                        'Log out',
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorManager.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {},
                      splashColor: ColorManager.primary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
