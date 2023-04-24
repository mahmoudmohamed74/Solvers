import 'package:flutter/material.dart';
import 'package:solvers/Auth/presentation/widgets/default_text_button.dart';
import 'package:solvers/client/presentation/widgets/appbar_widget.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/global/resources/values_manger.dart';

class TechCreateOfferPage extends StatelessWidget {
  TechCreateOfferPage({Key? key}) : super(key: key);

  final TextEditingController _textarea = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _earnestPrice = TextEditingController();

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 80,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "Create offer",
                  style: TextStyle(
                    fontSize: AppSize.s36,
                  ),
                ),
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "Request number :12345",
                  style: TextStyle(
                    fontSize: AppSize.s20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: AppSize.s40,
              ),
              const Text(
                "Price (In range between 10 SR -50 SR)",
                style: TextStyle(
                  fontSize: AppSize.s20,
                ),
              ),
              const SizedBox(
                height: AppSize.s10,
              ),
              Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(8),
                child: TextFormField(
                  controller: _price,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorManager.primary,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorManager.primary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorManager.purple,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: AppSize.s40,
              ),
              const Text(
                "Earnest (30% of the total price)",
                style: TextStyle(
                  fontSize: AppSize.s20,
                ),
              ),
              const SizedBox(
                height: AppSize.s10,
              ),
              Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(8),
                child: TextFormField(
                  controller: _earnestPrice,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorManager.primary,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorManager.primary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorManager.purple,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: AppSize.s30,
              ),
              const Text(
                "Any additional information (Optional)",
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
              const SizedBox(
                height: AppSize.s30,
              ),
              Align(
                alignment: Alignment.center,
                child: DefaultTextButton(
                  text: "Send",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
