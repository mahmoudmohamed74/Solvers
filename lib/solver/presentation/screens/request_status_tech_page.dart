import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/global/resources/values_manger.dart';
import 'package:solvers/solver/presentation/controller/tech_cubit.dart';
import 'package:solvers/solver/presentation/widgets/request_list.dart';

class TechRequestStatusPage extends StatelessWidget {
  const TechRequestStatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: AppPadding.p10,
                left: AppPadding.p20,
              ),
              child: Text(
                "Requests",
                style: TextStyle(
                  fontSize: AppSize.s36,
                ),
              ),
            ),
            BlocBuilder<TechCubit, TechState>(
              builder: (context, state) {
                final cubit = TechCubit.get(context).orderTech;
                if (state is GetAllOrderTechLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.purple,
                    ),
                  );
                }

                return ConditionalBuilder(
                  condition: cubit.isNotEmpty,
                  builder: (context) => ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return RequestList(
                        orderModel: cubit[index],
                        onAccept: () {
                          TechCubit.get(context).updateOrderAccepted(
                            context,
                            cubit[index].orderDocId,
                            "true",
                          );
                        },
                        onIgnore: () {
                          TechCubit.get(context).updateOrderAccepted(
                            context,
                            cubit[index].orderDocId,
                            "false",
                          );
                        },
                      );
                    },
                    itemCount: cubit.length,
                  ),
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
          ],
        ),
      ),
    );
  }
}
