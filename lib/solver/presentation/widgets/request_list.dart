import 'package:flutter/material.dart';
import 'package:solvers/client/data/models/order_model.dart';
import 'package:solvers/core/assets/app_assets.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/global/resources/values_manger.dart';

class RequestsListForTechWidget extends StatelessWidget {
  final OrderModel orderModel;
  final VoidCallback onIgnore;
  final VoidCallback onAccept;

  const RequestsListForTechWidget({
    super.key,
    required this.orderModel,
    required this.onIgnore,
    required this.onAccept,
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
                      "Request number: ${orderModel.orderId.substring(0, 8)}",
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
                          orderModel.clientName,
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
                    child: Text(
                      "status: ${orderModel.status[0].toUpperCase() + orderModel.status.substring(1)}",
                      style: const TextStyle(
                        fontSize: AppSize.s15,
                      ),
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
                        Expanded(
                          child: Text(
                            "Problem: ${orderModel.problemDescription}",
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: AppSize.s14,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (orderModel.status == "new")
                        InkWell(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                ImageAssets.greenBox,
                              ),
                              Image.asset(
                                ImageAssets.smallTrue,
                              ),
                            ],
                          ),
                          onTap: () => onAccept(),
                        ),
                      const SizedBox(
                        width: AppSize.s5,
                      ),
                      if (orderModel.status == "new")
                        InkWell(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                ImageAssets.redBox,
                              ),
                              Image.asset(
                                ImageAssets.rightLine,
                              ),
                              Image.asset(
                                ImageAssets.leftLine,
                              ),
                            ],
                          ),
                          onTap: () => onIgnore(),
                        ),
                    ],
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
