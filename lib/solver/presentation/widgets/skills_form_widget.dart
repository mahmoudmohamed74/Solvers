import 'package:flutter/material.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/global/resources/values_manger.dart';

class SkillsForm extends StatefulWidget {
  final List<String> skills;
  final Function(List<String>) onSkillsChanged;

  SkillsForm({required this.skills, required this.onSkillsChanged});

  @override
  _SkillsFormState createState() => _SkillsFormState();
}

class _SkillsFormState extends State<SkillsForm> {
  List<String> _selectedSkills = [];

  @override
  void initState() {
    super.initState();
    _selectedSkills = List<String>.from(widget.skills);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Skills',
          style: TextStyle(
            fontSize: AppSize.s15,
          ),
        ),
        Wrap(
          spacing: AppSize.s8,
          children: _buildSkillChips(),
        ),
        const SizedBox(
          height: AppSize.s8,
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(ColorManager.primary),
            foregroundColor:
                MaterialStateProperty.all<Color>(ColorManager.black),
          ),
          child: const Text(
            'Edit Skills',
            style: TextStyle(
              fontSize: AppSize.s15,
            ),
          ),
          onPressed: () {
            _showSkillsDialog(context);
          },
        ),
      ],
    );
  }

  List<Widget> _buildSkillChips() {
    return _selectedSkills.map((skill) {
      return Chip(
        label: Text(skill),
        onDeleted: () {
          setState(() {
            _selectedSkills.remove(skill);
            widget.onSkillsChanged(_selectedSkills);
          });
        },
      );
    }).toList();
  }

  void _showSkillsDialog(BuildContext context) async {
    final allSkills = [
      'Using New Application',
      'Java programming',
      'Backup',
      'Network',
      'Flutter',
      'Dart',
    ];
    final selectedSkills = Set<String>.from(_selectedSkills);

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select your skills'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: allSkills.map((skill) {
                return CheckboxListTile(
                  title: Text(skill),
                  value: selectedSkills.contains(skill),
                  controlAffinity: ListTileControlAffinity.trailing,
                  onChanged: (bool? value) {
                    setState(() {
                      if (value != null && value) {
                        selectedSkills.add(skill);
                      } else {
                        selectedSkills.remove(skill);
                      }
                    });
                  },
                );
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Save'),
              onPressed: () {
                setState(() {
                  _selectedSkills = List<String>.from(selectedSkills);
                  widget.onSkillsChanged(_selectedSkills);
                  Navigator.of(context).pop();
                });
              },
            ),
          ],
        );
      },
    );
  }
}

// The SkillsForm widget takes two parameters: skills and onSkillsChanged.
// skills is a list of the user's current skills, and onSkillsChanged is a function that will be called whenever the user updates their skills.
// In the initState() method, we initialize the _selectedSkills list with the values from the skills parameter.
// In the build() method, we display the current skills as Chip widgets and show a button that opens a dialog to edit the skills.
// The _buildSkillChips() method creates a list of Chip widgets based on the _selectedSkills list. Each Chip widget can be deleted by the user, which will remove the corresponding skill from the `_selectedSkills
