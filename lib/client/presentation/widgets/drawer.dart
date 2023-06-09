import 'package:flutter/material.dart';
import 'package:solvers/client/presentation/screens/help_page.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/global/resources/values_manger.dart';
import 'package:solvers/solver/presentation/screens/contactus_page.dart';

class MyDrawer extends StatelessWidget {
  final VoidCallback? onTap;
  const MyDrawer({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(AppSize.s20),
          bottomRight: Radius.circular(AppSize.s20),
          bottomLeft: Radius.circular(AppSize.s20),
        ),
        color: ColorManager.grey,
      ),
      height: 350.0,
      width: 200,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(AppSize.s20),
          bottomRight: Radius.circular(AppSize.s20),
          bottomLeft: Radius.circular(AppSize.s20),
        ),
        child: Drawer(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: AppSize.s40,
                  ),
                  Image.asset(
                    'assets/images/splash_logo.png',
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
              const SizedBox(
                height: AppSize.s20,
              ),
              SizedBox(
                height: AppSize.s180,
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
                          fontSize: AppSize.s16,
                          color: ColorManager.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HelpPage(),
                          ),
                        );
                      },
                      splashColor: ColorManager.selectedItem,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.phone_enabled_outlined,
                        color: ColorManager.grey,
                      ),
                      title: Text(
                        'Content us',
                        style: TextStyle(
                          fontSize: AppSize.s16,
                          color: ColorManager.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ContactUsPage(),
                          ),
                        );
                      },
                      splashColor: ColorManager.selectedItem,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.logout_outlined,
                        color: ColorManager.grey,
                      ),
                      title: Text(
                        'Log out',
                        style: TextStyle(
                          fontSize: AppSize.s16,
                          color: ColorManager.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: onTap,
                      splashColor: ColorManager.selectedItem,
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
