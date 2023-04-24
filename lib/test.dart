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
  List<String> _skills = ['Flutter', 'Dart', 'Firebase'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExperienceListWidget(),
            // Other profile information widgets...
          ],
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
