import 'package:flutter/material.dart';
import 'package:solvers/client/presentation/widgets/appbar_widget.dart';
import 'package:solvers/client/presentation/widgets/drawer.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      appBar: const AppBarWidget(),
      body: MyDrawer(),
    );
  }
}
