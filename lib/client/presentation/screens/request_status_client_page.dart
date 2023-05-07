import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvers/client/presentation/controller/client_cubit.dart';
import 'package:solvers/client/presentation/widgets/request_status.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/global/resources/values_manger.dart';

class ClientRequestStatusPage extends StatelessWidget {
  const ClientRequestStatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ClientCubit, ClientState>(
        builder: (context, state) {
          final ordersList = ClientCubit.get(context).allOrders;
          if (state is GetAllOrdersLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: ColorManager.purple,
              ),
            );
          }
          return ConditionalBuilder(
            condition: ordersList.isNotEmpty,
            builder: (context) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return RequestStatusWidget(orderModel: ordersList[index]);
                },
                itemCount: ordersList.length,
              );
            },
            fallback: (context) => SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  "You do'nt have any requests yet",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppSize.s32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
