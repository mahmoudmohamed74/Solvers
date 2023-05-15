part of 'client_cubit.dart';

@immutable
abstract class ClientState {}

class ClientInitial extends ClientState {}

class AppChangeBottomNavStates extends ClientState {}

class IsFirstNameValid extends ClientState {
  final bool isValid;

  IsFirstNameValid(this.isValid);
}

class IsLastNameValid extends ClientState {
  final bool isValid;

  IsLastNameValid(this.isValid);
}

class IsPhoneNumberValid extends ClientState {
  final bool isValid;

  IsPhoneNumberValid(this.isValid);
}

class OnFirstNameClicked extends ClientState {
  final bool isClicked;

  OnFirstNameClicked(this.isClicked);
}

class OnLastNameClicked extends ClientState {
  final bool isClicked;

  OnLastNameClicked(this.isClicked);
}

class OnPhoneClicked extends ClientState {
  final bool isClicked;

  OnPhoneClicked(this.isClicked);
}

// order
class CreateOrderLoadingState extends ClientState {}

class CreateOrderSuccessState extends ClientState {
  CreateOrderSuccessState();
}

class CreateOrderErrorState extends ClientState {
  final String error;

  CreateOrderErrorState(this.error);
}

class GetAllOrdersLoadingState extends ClientState {}

class GetAllOrdersEmptyState extends ClientState {}

class GetAllOrdersSuccessState extends ClientState {
  final List<OrderModel> orderModel;

  GetAllOrdersSuccessState(this.orderModel);
}

class GetAllOrdersErrorState extends ClientState {
  final String error;

  GetAllOrdersErrorState(this.error);
}

class GetAllOffersLoadingState extends ClientState {}

class GetAllOffersSuccessState extends ClientState {
  final List<OfferModel> allOffersList;

  GetAllOffersSuccessState({required this.allOffersList});
}

class GetAllOffersErrorState extends ClientState {
  final String error;

  GetAllOffersErrorState(this.error);
}

class UpdateOfferClientLoadingState extends ClientState {}

class UpdateOfferClientSuccessState extends ClientState {
  final List<OfferModel> updatedOfferModelList;

  UpdateOfferClientSuccessState({required this.updatedOfferModelList});
}

class UpdateOfferClientErrorState extends ClientState {
  final String error;

  UpdateOfferClientErrorState(this.error);
}

class UpdateClientDataLoadingState extends ClientState {}

class UpdateClientDataSuccessState extends ClientState {}

class UpdateClientDataErrorState extends ClientState {}
