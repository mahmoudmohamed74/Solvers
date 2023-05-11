import 'package:flutter/material.dart';
import 'package:solvers/client/presentation/widgets/default_appbar.dart';

class CardFormScreen extends StatelessWidget {
  const CardFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        leadingIconButton: const ThreeBlackLinesWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [],
        ),
      ),
    );
  }
}
