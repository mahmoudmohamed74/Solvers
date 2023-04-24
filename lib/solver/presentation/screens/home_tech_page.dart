import 'package:flutter/material.dart';
import 'package:solvers/core/global/resources/values_manger.dart';

class TechHomePage extends StatelessWidget {
  const TechHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(AppSize.s30),
      child: Text(
        "Welcome \nTechnician!!",
        style: TextStyle(
          fontSize: 64,
        ),
      ),
    );
  }
}
