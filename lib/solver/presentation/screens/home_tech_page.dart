import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/global/resources/values_manger.dart';
import 'package:solvers/solver/presentation/controller/tech_cubit.dart';

class TechHomePage extends StatelessWidget {
  const TechHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final techCubit = TechCubit.get(context);

    return BlocBuilder<TechCubit, TechState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(AppSize.s30),
          child: ConditionalBuilder(
            condition: techCubit.techData != null,
            builder: (context) {
              return Text(
                techCubit.techData!.firstName,
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
