import 'package:flutter/material.dart';
import 'package:solvers/Auth/presentation/widgets/default_text_button.dart';
import 'package:solvers/client/presentation/widgets/default_appbar.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/global/resources/values_manger.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  bool paymentIsExpanded = false;
  bool offerIsExpanded = false;
  bool requestIsExpanded = false;

  double _calculateContainerHeight() {
    if (paymentIsExpanded && offerIsExpanded && requestIsExpanded) {
      return AppSize.s500;
    } else if (paymentIsExpanded && offerIsExpanded) {
      return AppSize.s420;
    } else if (offerIsExpanded && requestIsExpanded) {
      return AppSize.s420;
    } else if (paymentIsExpanded && requestIsExpanded) {
      return AppSize.s420;
    } else if (paymentIsExpanded) {
      return AppSize.s338;
    } else if (offerIsExpanded) {
      return AppSize.s338;
    } else if (requestIsExpanded) {
      return AppSize.s338;
    } else {
      return AppSize.s260;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        leadingIconButton: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: ColorManager.darkPrimary,
            size: AppSize.s30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: AppSize.s20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: _calculateContainerHeight(),
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(AppSize.s20),
                  boxShadow: [
                    BoxShadow(
                      color: ColorManager.grey,
                      offset: const Offset(0.0, 4.0),
                      blurRadius: 4.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(AppPadding.p8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius: BorderRadius.circular(AppSize.s10),
                        ),
                        height: paymentIsExpanded ? AppSize.s150 : AppSize.s70,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(AppPadding.p8),
                              child: MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    paymentIsExpanded = !paymentIsExpanded;
                                  });
                                },
                                color: ColorManager.white,
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.circle,
                                      color: Colors.purple,
                                      size: 14.0,
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    const Text(
                                      'Payment problem?',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    Icon(
                                      paymentIsExpanded
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down,
                                      size: 40.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Visibility(
                              visible: paymentIsExpanded,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: TextField(
                                  maxLines: 2,
                                  decoration: InputDecoration(
                                    hintText: 'description',
                                    filled: true,
                                    fillColor: ColorManager.primary,
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(AppPadding.p8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius: BorderRadius.circular(AppSize.s10),
                        ),
                        height: offerIsExpanded ? AppSize.s150 : AppSize.s70,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(AppPadding.p8),
                              child: MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    offerIsExpanded = !offerIsExpanded;
                                  });
                                },
                                color: ColorManager.white,
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.circle,
                                      color: Colors.purple,
                                      size: 14.0,
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    const Text(
                                      'offer problem?',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    Icon(
                                      offerIsExpanded
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down,
                                      size: 40.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Visibility(
                              visible: offerIsExpanded,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: TextField(
                                  maxLines: 2,
                                  decoration: InputDecoration(
                                    hintText: 'description',
                                    filled: true,
                                    fillColor: ColorManager.primary,
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(AppPadding.p8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius: BorderRadius.circular(AppSize.s10),
                        ),
                        height: requestIsExpanded ? AppSize.s150 : AppSize.s70,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(AppPadding.p8),
                              child: MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    requestIsExpanded = !requestIsExpanded;
                                  });
                                },
                                color: ColorManager.white,
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.circle,
                                      color: Colors.purple,
                                      size: 14.0,
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    const Text(
                                      'request problem?',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    Icon(
                                      requestIsExpanded
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down,
                                      size: 40.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Visibility(
                              visible: requestIsExpanded,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: TextField(
                                  maxLines: 2,
                                  decoration: InputDecoration(
                                    hintText: 'description',
                                    filled: true,
                                    fillColor: ColorManager.primary,
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'need more help?',
                style: TextStyle(
                  fontSize: AppSize.s20,
                  color: ColorManager.selectedItem,
                ),
              ),
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            DefaultTextButton(
              text: 'Contact Us',
            ),
          ],
        ),
      ),
    );
  }
}
