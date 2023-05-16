import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvers/client/presentation/controller/client_cubit.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/global/resources/values_manger.dart';

class ClientHomePage extends StatelessWidget {
  const ClientHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final clientCubit = ClientCubit.get(context);
    return BlocBuilder<ClientCubit, ClientState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(AppSize.s30),
          child: ConditionalBuilder(
            condition: clientCubit.clientData != null,
            builder: (context) {
              return Text(
                clientCubit.clientData!.firstName,
                style: const TextStyle(
                  fontSize: 64,
                ),
              );
            },
            fallback: (context) {
              return Center(
                child: CircularProgressIndicator(
                  color: ColorManager.purple,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
