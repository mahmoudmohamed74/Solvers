part of 'client_cubit.dart';

@immutable
abstract class ClientState {}

class ClientInitial extends ClientState {}

class AppChangeBottomNavStates extends ClientState {}

// order

class CreateOrderLoadingState extends ClientState {}

class CreateOrderSuccessState extends ClientState {
  CreateOrderSuccessState();
}

class CreateOrderErrorState extends ClientState {
  final String error;

  CreateOrderErrorState(this.error);
}

class GetOrderLoadingState extends ClientState {}

class GetOrderEmptyState extends ClientState {}

class GetOrderSuccessState extends ClientState {
  final List<OrderModel> orderModel;

  GetOrderSuccessState(this.orderModel);
}

class GetOrderErrorState extends ClientState {
  final String error;

  GetOrderErrorState(this.error);
}
