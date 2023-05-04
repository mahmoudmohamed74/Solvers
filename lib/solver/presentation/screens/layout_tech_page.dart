import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvers/client/presentation/widgets/appbar_widget.dart';
import 'package:solvers/client/presentation/widgets/drawer.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/global/resources/values_manger.dart';
import 'package:solvers/solver/presentation/controller/tech_cubit.dart';

class TechLayout extends StatelessWidget {
  const TechLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TechCubit(),
      child: BlocConsumer<TechCubit, TechState>(
        listener: (context, state) {},
        builder: (context, state) {
          var clientCubit = TechCubit.get(context);
          return Scaffold(
            appBar: AppBarWidget(),
            drawer: const Align(
              alignment: Alignment.topLeft,
              child: MyDrawer(),
            ),
            body: clientCubit.screens[clientCubit.currentIndex],
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
                          clientCubit.changeBottomNav(0);
                        },
                        minWidth: 100,
                        child: Icon(
                          Icons.home,
                          size: 35,
                          color: clientCubit.currentIndex == 0
                              ? ColorManager.black
                              : ColorManager.white,
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          clientCubit.changeBottomNav(1);
                        },
                        minWidth: 100,
                        child: Icon(
                          Icons.chat,
                          size: 35,
                          color: clientCubit.currentIndex == 1
                              ? ColorManager.black
                              : ColorManager.white,
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          clientCubit.changeBottomNav(2);
                        },
                        minWidth: 100,
                        child: Icon(
                          Icons.mark_as_unread,
                          size: 35,
                          color: clientCubit.currentIndex == 2
                              ? ColorManager.black
                              : ColorManager.white,
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          clientCubit.changeBottomNav(3);
                        },
                        minWidth: 70,
                        child: Icon(
                          Icons.person_outline_outlined,
                          size: 35,
                          color: clientCubit.currentIndex == 3
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
      ),
    );
  }
}
