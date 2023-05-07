import 'package:flutter/material.dart';

import 'package:solvers/client/data/models/order_model.dart';
import 'package:solvers/client/presentation/controller/client_cubit.dart';
import 'package:solvers/client/presentation/screens/offers_client_page.dart';
import 'package:solvers/core/assets/app_assets.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/global/resources/values_manger.dart';

class RequestStatusWidget extends StatelessWidget {
  final OrderModel orderModel;

  const RequestStatusWidget({super.key, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);

    final clientCubit = ClientCubit.get(context);
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
                    height: AppSize.s30,
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
                    height: AppSize.s15,
                  ),
                  Row(
                    children: [
                      Image.asset(ImageAssets.dateTime),
                      const SizedBox(
                        width: AppSize.s10,
                      ),
                      Text(
                        orderModel.dateTime,
                        style: const TextStyle(
                          fontSize: AppSize.s15,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppSize.s15,
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
                  if (orderModel.status == 'new')
                    Padding(
                      padding: const EdgeInsets.only(
                        left: AppPadding.p35,
                      ),
                      child: InkWell(
                        onTap: () async {
                          // print(orderModel.orderId);

                          // print(orderModel.orderDocId);

                          await clientCubit.getOffer(orderModel.orderDocId);

                          navigator.pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => ClientOffersPage(
                                orderId: orderModel.orderId,
                                orderDocId: orderModel.orderDocId,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "view details",
                          style: TextStyle(
                            fontSize: AppSize.s12,
                            color: ColorManager.purple,
                          ),
                        ),
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
