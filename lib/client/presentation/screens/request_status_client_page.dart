import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvers/client/presentation/controller/client_cubit.dart';
import 'package:solvers/client/presentation/widgets/request_status.dart';

class ClientRequestStatusPage extends StatelessWidget {
  const ClientRequestStatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClientCubit, ClientState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: ConditionalBuilder(
            condition: ClientCubit.get(context).orders!.isNotEmpty,
            builder: (context) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final orderIndex = ClientCubit.get(context).orders![index];
                  return RequestStatusWidget(orderModel: orderIndex);
                },
                itemCount: ClientCubit.get(context).orders!.length,
              );
            },
            fallback: (context) => Container(),
          ),
        );
      },
    );
  }
}
