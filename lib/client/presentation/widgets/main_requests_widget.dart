import 'package:flutter/material.dart';
import 'package:solvers/client/data/models/order_model.dart';
import 'package:solvers/core/assets/app_assets.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/global/resources/values_manger.dart';
import 'package:solvers/solver/data/models/offer_model.dart';

class MainRequestsWidget extends StatelessWidget {
  final OrderModel orderModel;
  // final OfferModel offerModel;
  const MainRequestsWidget({
    super.key,
    required this.orderModel,
    // required this.offerModel,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: Container(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: AppPadding.p35,
                    ),
                    child: Text(
                      "Request number:  ${orderModel.orderId.substring(0, 8)}",
                      style: const TextStyle(
                        fontSize: AppSize.s15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: AppPadding.p10,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          ImageAssets.smallPerson,
                        ),
                        const SizedBox(
                          width: AppSize.s10,
                        ),
                        Text(
                          orderModel.techName != ""
                              ? orderModel.techName
                              : "Searching for Technician",
                          style: const TextStyle(
                            fontSize: AppSize.s15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: AppPadding.p6,
                    ),
                    child: Row(
                      children: [
                        Image.asset(ImageAssets.dateTime),
                        const SizedBox(
                          width: AppSize.s5,
                        ),
                        Text(
                          orderModel.dateTime,
                          style: const TextStyle(
                            fontSize: AppSize.s15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: AppPadding.p35,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Earnest: ${orderModel.earnest} SR",
                          style: const TextStyle(
                            fontSize: AppSize.s15,
                          ),
                        ),
                        const SizedBox(
                          width: AppSize.s10,
                        ),
                        Container(
                          color: ColorManager.green,
                          height: AppSize.s18,
                          width: AppSize.s60,
                          child: const Center(
                            child: Text(
                              "PAID",
                              style: TextStyle(fontSize: AppSize.s13),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: AppPadding.p35,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Remaining amount: ${int.parse(orderModel.price) - int.parse(orderModel.earnest)} SR",
                          style: const TextStyle(
                            fontSize: AppSize.s15,
                          ),
                        ),
                        const SizedBox(
                          width: AppSize.s10,
                        ),
                        Container(
                          color: ColorManager.grey,
                          height: AppSize.s18,
                          width: AppSize.s60,
                          child: const Center(
                            child: Text(
                              "PAY NOW",
                              style: TextStyle(fontSize: AppSize.s13),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: AppPadding.p35,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Status:  ${orderModel.status[0].toUpperCase() + orderModel.status.substring(1)}",
                          style: const TextStyle(
                            fontSize: AppSize.s15,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(AppPadding.p5),
                                child: Image.asset(ImageAssets.chat),
                              ),
                              CircleAvatar(
                                radius: 5,
                                backgroundColor: ColorManager.red,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Align(
            alignment: Alignment.topLeft,
            child: CircleAvatar(
              backgroundColor: orderModel.status == 'solved'
                  ? ColorManager.green
                  : orderModel.status == 'new'
                      ? ColorManager.red
                      : ColorManager.orange,
              radius: AppSize.s14,
            ),
          ),
        ),
      ],
    );
  }
}
