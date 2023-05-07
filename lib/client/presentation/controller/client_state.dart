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
