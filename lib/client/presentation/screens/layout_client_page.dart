import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvers/Auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:solvers/client/presentation/controller/client_cubit.dart';
import 'package:solvers/client/presentation/widgets/appbar_widget.dart';
import 'package:solvers/client/presentation/widgets/drawer.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/global/resources/values_manger.dart';
import 'package:solvers/core/routes/app_routes.dart';

class ClientLayout extends StatelessWidget {
  const ClientLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final authCubit = BlocProvider.of<FirebaseAuthCubit>(context);

    return BlocConsumer<ClientCubit, ClientState>(
      listener: (context, state) {},
      builder: (context, state) {
        var clientCubit = ClientCubit.get(context);
        return Scaffold(
          appBar: AppBarWidget(),
          drawer: const Align(
            alignment: Alignment.topLeft,
            child: MyDrawer(),
          ),
          body: clientCubit.screens[clientCubit.currentIndex],
          floatingActionButton: SizedBox(
            height: 50,
            width: 50,
            child: FloatingActionButton(
              backgroundColor: ColorManager.white,
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  Routes.createNewRequest,
                );
              },
              child: Icon(
                Icons.add,
                size: 30,
                color: ColorManager.black,
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppSize.s18),
              topRight: Radius.circular(AppSize.s18),
            ),
            child: BottomAppBar(
              color: ColorManager.selectedItem,
              shape: const CircularNotchedRectangle(),
              notchMargin: 8,
              child: SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            clientCubit.changeBottomNav(0);
                          },
                          minWidth: 40,
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
                          minWidth: 40,
                          child: Icon(
                            Icons.chat,
                            size: 35,
                            color: clientCubit.currentIndex == 1
                                ? ColorManager.black
                                : ColorManager.white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            clientCubit.changeBottomNav(2);
                            clientCubit.getOrder(
                              FirebaseAuthCubit.get(context)
                                  .clientData!
                                  .clientId,
                            );
                          },
                          minWidth: 40,
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
                          minWidth: 40,
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
