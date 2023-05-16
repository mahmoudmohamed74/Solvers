part of 'tech_cubit.dart';

@immutable
abstract class TechState {}

class TechInitial extends TechState {}

class AppChangeBottomNavStates extends TechState {}

// get tech

class GetTechLoading extends TechState {}

class GetTechSuccess extends TechState {
  final TechModel? techModel;

  GetTechSuccess(this.techModel);
}

class GetTechFailed extends TechState {
  final String error;

  GetTechFailed(this.error);
}

class GetTechError extends TechState {
  final String error;

  GetTechError(this.error);
}

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

class GetAcceptedOrdersLoadingState extends TechState {}

class GetAcceptedOrdersSuccessState extends TechState {
  final List<OrderModel> acceptedOrders;

  GetAcceptedOrdersSuccessState(this.acceptedOrders);
}

class GetAcceptedOrdersErrorState extends TechState {
  final String error;

  GetAcceptedOrdersErrorState(this.error);
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

class UpdateTechDataLoadingState extends TechState {}

class UpdateTechDataSuccessState extends TechState {}

class UpdateTechDataErrorState extends TechState {}

class IsFirstNameValid extends TechState {
  final bool isValid;

  IsFirstNameValid(this.isValid);
}

class IsLastNameValid extends TechState {
  final bool isValid;

  IsLastNameValid(this.isValid);
}

class IsPhoneNumberValid extends TechState {
  final bool isValid;

  IsPhoneNumberValid(this.isValid);
}

class OnFirstNameClicked extends TechState {
  final bool isClicked;

  OnFirstNameClicked(this.isClicked);
}

class OnLastNameClicked extends TechState {
  final bool isClicked;

  OnLastNameClicked(this.isClicked);
}

class OnPhoneClicked extends TechState {
  final bool isClicked;

  OnPhoneClicked(this.isClicked);
}
