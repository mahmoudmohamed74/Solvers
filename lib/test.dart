import 'package:flutter/material.dart';
import 'package:solvers/client/presentation/screens/home_client_page.dart';
import 'package:solvers/client/presentation/screens/payment_method.dart';
import 'package:solvers/client/presentation/widgets/default_appbar.dart';
import 'package:solvers/client/presentation/widgets/drawer.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/services/payment/stripe_payment.dart';

import 'core/services/payment/paypal_payment.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(leadingIconButton: ThreeBlackLinesWidget()),
      body: Center(
        child: TextButton(
          child: const Text("pay"),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => const PaymentMethod(
                      amount: 300,
                    )));
          },
        ),
      ),
    );
  }
}

class ExperienceListWidget extends StatefulWidget {
  const ExperienceListWidget({Key? key}) : super(key: key);

  @override
  _ExperienceListWidgetState createState() => _ExperienceListWidgetState();
}

class _ExperienceListWidgetState extends State<ExperienceListWidget> {
  List<String> _experiences = ['Experience 1', 'Experience 2', 'Experience 3'];
  TextEditingController _experienceController = TextEditingController();

  void _addExperience() {
    setState(() {
      _experiences.add(_experienceController.text);
      _experienceController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experience List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _experienceController,
              decoration: InputDecoration(
                labelText: 'Enter new experience',
              ),
            ),
            ElevatedButton(
              onPressed: _addExperience,
              child: const Text('Add'),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Old Experiences:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: _experiences.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(_experiences[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
