part of 'tech_cubit.dart';

@immutable
abstract class TechState {}

class TechInitial extends TechState {}

class AppChangeBottomNavStates extends TechState {}

class CreateOfferLoadingState extends TechState {}

class CreateOfferSuccessState extends TechState {}

class CreateOfferErrorState extends TechState {
  final String error;

  CreateOfferErrorState(this.error);
}

class GetAllOrderTechLoadingState extends TechState {}

class GetAllOrderTechSuccessState extends TechState {
  final List<OrderModel> stateAllOrders;

  GetAllOrderTechSuccessState(this.stateAllOrders);
}

class GetAllOrderTechErrorState extends TechState {
  final String error;

  GetAllOrderTechErrorState(this.error);
}

class UpdateOrderTechLoadingState extends TechState {}

class UpdateOrderTechSuccessState extends TechState {
  final List<OrderModel> stateOrdersRequests;

  UpdateOrderTechSuccessState(this.stateOrdersRequests);
}

class UpdateOrderTechErrorState extends TechState {
  final String error;

  UpdateOrderTechErrorState(this.error);
}
