import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvers/client/presentation/widgets/default_appbar.dart';
import 'package:solvers/client/presentation/widgets/drawer.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/global/resources/values_manger.dart';

import 'package:solvers/solver/presentation/controller/tech_cubit.dart';

class TechLayout extends StatelessWidget {
  const TechLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final techCubit = TechCubit.get(context);

    return BlocConsumer<TechCubit, TechState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: const DefaultAppBar(
            leadingIconButton: ThreeBlackLinesWidget(),
          ),
          drawer: Align(
            alignment: Alignment.topLeft,
            child: MyDrawer(
              onTap: () {
                TechCubit.get(context).techSignOut(context: context);
              },
            ),
          ),
          body: techCubit.screens[techCubit.currentIndex],
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppSize.s18),
              topRight: Radius.circular(AppSize.s18),
            ),
            child: BottomAppBar(
              color: ColorManager.selectedItem,
              child: SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        techCubit.changeBottomNav(0);
                      },
                      minWidth: 100,
                      child: Icon(
                        Icons.home,
                        size: 35,
                        color: techCubit.currentIndex == 0
                            ? ColorManager.black
                            : ColorManager.white,
                      ),
                    ),
                    MaterialButton(
                      onPressed: () async {
                        techCubit.changeBottomNav(1);
                        await techCubit.getAcceptedOrders(
                          techCubit.techId!,
                        );
                      },
                      minWidth: 100,
                      child: Icon(
                        Icons.chat,
                        size: 35,
                        color: techCubit.currentIndex == 1
                            ? ColorManager.black
                            : ColorManager.white,
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        techCubit.changeBottomNav(2);
                        techCubit.getOrderTech(
                          techCubit.techId!,
                        );
                      },
                      minWidth: 100,
                      child: Icon(
                        Icons.mark_as_unread,
                        size: 35,
                        color: techCubit.currentIndex == 2
                            ? ColorManager.black
                            : ColorManager.white,
                      ),
                    ),
                    MaterialButton(
                      onPressed: () async {
                        techCubit.changeBottomNav(3);
                        await techCubit.getTechCubit();
                      },
                      minWidth: 70,
                      child: Icon(
                        Icons.person_outline_outlined,
                        size: 35,
                        color: techCubit.currentIndex == 3
                            ? ColorManager.black
                            : ColorManager.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
