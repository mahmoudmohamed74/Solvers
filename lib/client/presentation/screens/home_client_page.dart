import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvers/Auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:solvers/core/global/resources/values_manger.dart';

class ClientHomePage extends StatelessWidget {
  const ClientHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<FirebaseAuthCubit>(context);

    return Padding(
      padding: const EdgeInsets.all(AppSize.s30),
      child: Text(
        authCubit.clientData!.firstName,
        style: const TextStyle(
          fontSize: 64,
        ),
      ),
    );
  }
}
