import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvers/client/data/models/order_model.dart';
import 'package:solvers/client/domain/usecases/create_order_use_case.dart';
import 'package:solvers/client/presentation/screens/home_client_page.dart';
import 'package:solvers/client/presentation/screens/my_requests_client_page.dart';
import 'package:solvers/client/presentation/screens/profile_page_client.dart';
import 'package:solvers/client/presentation/screens/request_status_client_page.dart';

part 'client_state.dart';

class ClientCubit extends Cubit<ClientState> {
  CreateOrderUseCase createOrderUseCase;

  ClientCubit(this.createOrderUseCase) : super(ClientInitial());

  static ClientCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    const ClientHomePage(),
    const ClientMyRequestPage(),
    const ClientRequestStatusPage(),
    ClientProfilePage(),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavStates());
  }

  Future<void> createOrder(
    OrderModel orderModel,
    // String clientName,
    // String clientId,
    // String dateTime,
    // List<String> mainProblem,
    // List<String> specificProblem,
  ) async {
    emit(CreateOrderLoadingState());

    // OrderModel orderModel = OrderModel(
    //   clientName: clientName,
    //   clientId: "IjPMaJsgP5XJ8u5AQvzrwijWCrp2",
    //   dateTime: "1:37 am",
    //   mainProblem: mainProblem,
    //   specificProblem: specificProblem,
    // );
    try {
      await createOrderUseCase.call(params: orderModel);
      emit(CreateOrderSuccessState(orderModel));
    } catch (e) {
      print("cubit create order error ${e.toString()}");
      emit(CreateOrderErrorState(e.toString()));
    }
  }
}
