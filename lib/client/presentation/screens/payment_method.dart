import 'package:flutter/material.dart';
import 'package:solvers/client/presentation/widgets/default_appbar.dart';
import 'package:solvers/core/assets/app_assets.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/global/resources/values_manger.dart';
import 'package:solvers/core/services/payment/paypal_payment.dart';
import 'package:solvers/core/services/payment/stripe_payment.dart';

class PaymentMethod extends StatelessWidget {
  final double amount;

  const PaymentMethod({Key? key, required this.amount}) : super(key: key);

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
      body: Column(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  const Text(
                    'Payment',
                    style: TextStyle(
                      fontSize: AppSize.s36,
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  const Text(
                    'Choose payment method',
                    style: TextStyle(
                      fontSize: AppSize.s20,
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s10,
                  ),
                  Container(
                    height: AppSize.s180,
                    width: MediaQuery.of(context).size.width / 1,
                    decoration: BoxDecoration(
                      color: ColorManager.primary,
                      borderRadius: BorderRadius.circular(AppSize.s15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          spreadRadius: AppSize.s2,
                          blurRadius: AppSize.s5,
                          offset: const Offset(AppSize.s0, AppSize.s3),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: AppPadding.p20,
                      ),
                      child: Row(
                        children: [
                          Image.asset(ImageAssets.credit),
                          const SizedBox(
                            width: AppSize.s20,
                          ),
                          SizedBox(
                            width: AppSize.s150,
                            child: TextButton(
                              onPressed: () async {
                                await initPayment(
                                  amount: amount * 100,
                                  context: context,
                                  email: 'fezo10@test.com',
                                );
                              },
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(5),
                                backgroundColor: MaterialStateProperty.all(
                                    ColorManager.selectedItem),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s10),
                                  ),
                                ),
                              ),
                              child: Text(
                                "Credit card",
                                style: TextStyle(
                                  fontSize: AppSize.s20,
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.black,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s30,
                  ),
                  Container(
                    height: AppSize.s180,
                    width: MediaQuery.of(context).size.width / 1,
                    decoration: BoxDecoration(
                      color: ColorManager.primary,
                      borderRadius: BorderRadius.circular(AppSize.s15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          spreadRadius: AppSize.s2,
                          blurRadius: AppSize.s5,
                          offset: const Offset(AppSize.s0, AppSize.s3),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: AppPadding.p20,
                      ),
                      child: Row(
                        children: [
                          Image.asset(ImageAssets.paypal),
                          const SizedBox(
                            width: AppSize.s20,
                          ),
                          SizedBox(
                            width: AppSize.s150,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PaypalPayment(
                                            amount: amount,
                                          )),
                                );
                              },
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(5),
                                backgroundColor: MaterialStateProperty.all(
                                    ColorManager.selectedItem),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s10),
                                  ),
                                ),
                              ),
                              child: Text(
                                "PayPal",
                                style: TextStyle(
                                  fontSize: AppSize.s20,
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.black,
                                  fontStyle: FontStyle.normal,
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
          const Spacer(),
          Container(
            height: AppSize.s150,
            width: MediaQuery.of(context).size.width / 1,
            decoration: BoxDecoration(
              color: ColorManager.selectedItem,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppSize.s25),
                topRight: Radius.circular(AppSize.s25),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: AppPadding.p30,
                right: AppPadding.p30,
              ),
              child: Row(
                children: [
                  Container(
                    height: AppSize.s60,
                    width: AppSize.s150,
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Pay',
                        style: TextStyle(
                          fontSize: AppSize.s40,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '$amount USD',
                    style: TextStyle(
                      fontSize: AppSize.s40,
                      color: ColorManager.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
