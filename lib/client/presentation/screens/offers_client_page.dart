import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvers/client/data/requests/update_order_offer_request.dart';
import 'package:solvers/client/presentation/controller/client_cubit.dart';
import 'package:solvers/client/presentation/widgets/default_appbar.dart';
import 'package:solvers/client/presentation/widgets/offers_list.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/global/resources/values_manger.dart';
import 'package:solvers/core/routes/app_routes.dart';

class ClientOffersPage extends StatelessWidget {
  final String? orderId;
  final String? orderDocId;
  const ClientOffersPage({Key? key, this.orderId, this.orderDocId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        leadingIconButton: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              Routes.layoutClient,
            );
          },
          icon: Icon(
            Icons.arrow_back,
            color: ColorManager.darkPrimary,
            size: AppSize.s30,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / AppSize.s50,
              ),
              const Text(
                "Offers",
                style: TextStyle(
                  fontSize: AppSize.s40,
                ),
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "Request Number",
                  style: TextStyle(
                    fontSize: AppSize.s32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  orderId!.substring(0, 8),
                  style: const TextStyle(
                    fontSize: AppSize.s32,
                  ),
                ),
              ),
              BlocBuilder<ClientCubit, ClientState>(
                builder: (context, state) {
                  final clientListOffers =
                      ClientCubit.get(context).clientOffers;
                  if (state is GetAllOffersLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: ColorManager.purple,
                      ),
                    );
                  }
                  if (state is UpdateOfferClientLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: ColorManager.purple,
                      ),
                    );
                  }
                  return ConditionalBuilder(
                    condition: clientListOffers.isNotEmpty,
                    builder: (context) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return OfferListWidget(
                            offerModel: clientListOffers[index],
                            onAccept: () {
                              ClientCubit.get(context).updateOrderOfferType(
                                context,
                                UpdateOrderOffer(
                                  orderDocId: orderDocId!,
                                  status: "Under-progress",
                                  techName: clientListOffers[index].techName,
                                  price: clientListOffers[index].price,
                                  earnest: clientListOffers[index].earnest,
                                  techId: clientListOffers[index].techId,
                                  isAcceptedOffer: "true",
                                  priceIsPaid: "false",
                                  earnestIsPaid: "false",
                                ),
                              );
                            },
                            onIgnore: () {
                              ClientCubit.get(context).updateOrderOfferType(
                                context,
                                UpdateOrderOffer(
                                  orderDocId: orderDocId!,
                                  status: "new",
                                  techName: "",
                                  price: "0",
                                  earnest: "0",
                                  techId: clientListOffers[index].techId,
                                  isAcceptedOffer: "false",
                                  priceIsPaid: "",
                                  earnestIsPaid: "",
                                ),
                              );
                            },
                          );
                        },
                        itemCount: clientListOffers.length,
                      );
                    },
                    fallback: (context) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        child: const Center(
                          child: Text(
                            'You don\'t have any offers yet.',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
