import 'package:flutter/material.dart';

class ClientHomePage extends StatelessWidget {
  const ClientHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(30),
      child: Text(
        "Welcome \nUsername!",
        style: TextStyle(
          fontSize: 64,
        ),
      ),
    );
  }
}
