import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:solvers/Auth/presentation/widgets/default_text_button.dart';
import 'package:solvers/Auth/presentation/widgets/multi_drop_down%20_button.dart';
import 'package:solvers/client/presentation/widgets/appbar_widget.dart';
import 'package:solvers/core/global/resources/strings_manger.dart';
import 'package:solvers/core/global/resources/values_manger.dart';
import 'package:solvers/core/global/resources/color_manager.dart';

class ClientNewRequestPage extends StatefulWidget {
  const ClientNewRequestPage({Key? key}) : super(key: key);

  @override
  State<ClientNewRequestPage> createState() => _ClientNewRequestPageState();
}

class _ClientNewRequestPageState extends State<ClientNewRequestPage> {
  final TextEditingController _textarea = TextEditingController();
  bool isChecked = false;

  final List<String> items = [
    'Using New Application',
    'Java programming',
    'Backup',
    'Network',
    'Flutter',
    'Dart',
  ];
  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: AppSize.s20,
            ),
            const Text(
              "Create New Request",
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            MultiDropDownButtonWidget(
              title: "Main problem",
              items: const [
                'Using New Application',
                'Java programming',
                'Backup',
                'Network',
                'Flutter',
                'Dart',
              ],
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            MultiDropDownButtonWidget(
              title: "Specific problem",
              items: const [
                'Using New Application',
                'Java programming',
                'Backup',
                'Network',
                'Flutter',
                'Dart',
              ],
            ),
            const SizedBox(
              height: AppSize.s30,
            ),
            Padding(
              padding: const EdgeInsets.all(AppSize.s20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Problem description",
                    style: TextStyle(
                      fontSize: AppSize.s20,
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s10,
                  ),
                  TextFormField(
                    controller: _textarea,
                    textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Your text here...",
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorManager.grey, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorManager.purple, width: 2.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            DefaultTextButton(
              text: AppStrings.signUp,
              fontWeight: FontWeight.normal,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
