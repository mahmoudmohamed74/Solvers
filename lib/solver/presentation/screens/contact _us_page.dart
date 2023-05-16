import 'package:flutter/material.dart';
import 'package:solvers/client/presentation/widgets/default_appbar.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/global/resources/values_manger.dart';
import 'package:solvers/core/routes/app_routes.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        leadingIconButton: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              Routes.layoutClient,
            );
          },
          icon: Icon(
            Icons.arrow_back,
            color: ColorManager.darkPrimary,
            size: AppSize.s30,
          ),
        ),
      ),
      body: Column(),
    );
  }
}
