part of 'client_cubit.dart';

@immutable
abstract class ClientState {}

class ClientInitial extends ClientState {}

class AppChangeBottomNavStates extends ClientState {}

// order

class CreateOrderLoadingState extends ClientState {}

class CreateOrderSuccessState extends ClientState {
  final OrderModel orderModel;

  CreateOrderSuccessState(this.orderModel);
}

class CreateOrderErrorState extends ClientState {
  final String error;

  CreateOrderErrorState(this.error);
}
