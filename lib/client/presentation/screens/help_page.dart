import 'package:flutter/material.dart';
import 'package:solvers/Auth/presentation/widgets/default_text_button.dart';
import 'package:solvers/client/presentation/widgets/appbar_widget.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/global/resources/values_manger.dart';

class HelpPage extends StatelessWidget {
  HelpPage({Key? key}) : super(key: key);

  final TextEditingController _textarea = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        isBack: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 18,
              ),
              const Text(
                "Customer service",
                style: TextStyle(
                  fontSize: AppSize.s30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              const Text(
                "We are here for you!",
                style: TextStyle(
                  fontSize: AppSize.s20,
                ),
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              const Text(
                "How  can we help you?",
                style: TextStyle(
                  fontSize: AppSize.s20,
                ),
              ),
              const SizedBox(
                height: AppSize.s30,
              ),
              TextFormField(
                controller: _textarea,
                textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
                maxLines: 15,
                decoration: InputDecoration(
                  hintText: "Go ahead, we are listening ...",
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
              const SizedBox(
                height: AppSize.s30,
              ),
              DefaultTextButton(
                text: "Send",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
