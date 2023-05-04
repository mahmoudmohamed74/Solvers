// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:solvers/client/data/datasource/create_order.dart';
import 'package:solvers/client/data/models/order_model.dart';
import 'package:solvers/client/domain/usecases/create_order_use_case.dart';
import 'package:solvers/client/domain/usecases/get_order_use_case.dart';
import 'package:solvers/client/presentation/screens/home_client_page.dart';
import 'package:solvers/client/presentation/screens/my_requests_client_page.dart';
import 'package:solvers/client/presentation/screens/profile_page_client.dart';
import 'package:solvers/client/presentation/screens/request_status_client_page.dart';

part 'client_state.dart';

class ClientCubit extends Cubit<ClientState> {
  final CreateOrderUseCase _createOrderUseCase;
  final GetOrderToClientUseCase _getOrderToClientUseCase;
  List<OrderModel>? orders = [];
  String? setSuccessOrderId;
  ClientCubit(
    this._createOrderUseCase,
    this._getOrderToClientUseCase,
  ) : super(ClientInitial());

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
  ) async {
    emit(CreateOrderLoadingState());

    try {
      await _createOrderUseCase.call(params: orderModel);
      emit(CreateOrderSuccessState());
      await getOrder(orderModel.clientId);
      emit(CreateOrderSuccessState());
    } catch (e) {
      print("cubit create order error ${e.toString()}");
      emit(CreateOrderErrorState(e.toString()));
    }
  }

  Future<List<OrderModel>?> getOrder(String clientId) async {
    emit(GetOrderLoadingState());
    return await _getOrderToClientUseCase.call(params: clientId).then((value) {
      orders = value;
      print(orders);
      if (orders!.isEmpty) {
        emit(GetOrderEmptyState());
      } else {
        emit(GetOrderSuccessState(orders!));
      }
    }).catchError((error) {
      emit(GetOrderErrorState(error.toString()));
    });
  }
}
