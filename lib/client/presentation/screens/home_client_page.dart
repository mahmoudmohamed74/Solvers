import 'package:flutter/material.dart';
import 'package:solvers/core/global/resources/values_manger.dart';

class ClientHomePage extends StatelessWidget {
  const ClientHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(AppSize.s30),
      child: Text(
        "Welcome \nUsername!",
        style: TextStyle(
          fontSize: 64,
        ),
      ),
    );
  }
}
