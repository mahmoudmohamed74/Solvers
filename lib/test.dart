import 'package:flutter/material.dart';
import 'package:solvers/client/presentation/screens/home_client_page.dart';
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
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(),
      body: MyDrawer(),
    );
  }
}
