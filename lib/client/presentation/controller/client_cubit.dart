import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvers/client/data/datasource/create_order.dart';

import 'package:solvers/client/data/models/order_model.dart';
import 'package:solvers/client/domain/entities/update_order_offer.dart';
import 'package:solvers/client/domain/usecases/create_order_use_case.dart';
import 'package:solvers/client/domain/usecases/get_all_offers_use_case.dart';
import 'package:solvers/client/domain/usecases/get_order_use_case.dart';
import 'package:solvers/client/domain/usecases/update_order_offer_use_case.dart';
import 'package:solvers/client/presentation/screens/home_client_page.dart';
import 'package:solvers/client/presentation/screens/my_requests_client_page.dart';
import 'package:solvers/client/presentation/screens/profile_page_client.dart';
import 'package:solvers/client/presentation/screens/request_status_client_page.dart';
import 'package:solvers/solver/data/models/offer_model.dart';

part 'client_state.dart';

class ClientCubit extends Cubit<ClientState> {
  final CreateOrderUseCase _createOrderUseCase;
  final GetOrderToClientUseCase _getOrderToClientUseCase;
  final GetAllOffersToClientUseCase _getAllOffersToClientUseCase;
  final UpdateOrderOfferUseCase _updateOrderOfferUseCase;
  final FireStoreCreateOrder _fireStoreCreateOrder;
  ClientCubit(
    this._createOrderUseCase,
    this._getOrderToClientUseCase,
    this._getAllOffersToClientUseCase,
    this._updateOrderOfferUseCase,
    this._fireStoreCreateOrder,
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

  List<OrderModel> allOrders = [];
  Future<List<OrderModel>> getOrder(String clientId) async {
    allOrders = [];
    emit(GetAllOrdersLoadingState());
    return await _getOrderToClientUseCase.call(params: clientId).then((value) {
      allOrders = value;
      // print(allOrders);

      if (allOrders.isEmpty) {
        emit(GetAllOrdersEmptyState());
      } else {
        emit(GetAllOrdersSuccessState(allOrders));
      }
      return allOrders;
    }).catchError((error) {
      emit(GetAllOrdersErrorState(error.toString()));
    });
  }

  List<OfferModel> allOffers = [];
  List<OfferModel> clientOffers = [];
  List<OfferModel> acceptedOffers = [];

  Future<List<OfferModel>> getOffer(String orderId) async {
    allOffers = [];
    clientOffers = [];
    acceptedOffers = [];
    emit(GetAllOffersLoadingState());
    return await _getAllOffersToClientUseCase.call(params: orderId).then(
      (value) {
        value.forEach(
          (element) {
            if (element.accepted == '' || element.accepted == 'true') {
              clientOffers.add(element);
            } else if (element.accepted == 'true') {
              acceptedOffers.add(element);
            }
          },
        );
        allOffers = value;
        // print("allOffers $allOffers");
        emit(GetAllOffersSuccessState(allOffersList: allOffers));
        return allOffers;
      },
    ).catchError(
      (error) {
        emit(GetAllOffersErrorState(error.toString()));
      },
    );
  }

  Future<void> updateOrderOfferType(
    context,
    UpdateOrderOffer updateOrderOffer,
  ) async {
    emit(UpdateOfferClientLoadingState());
    await _updateOrderOfferUseCase.call(params: updateOrderOffer).then(
      (value) {
        getOffer(updateOrderOffer.orderDocId);

        emit(
          UpdateOfferClientSuccessState(updatedOfferModelList: clientOffers),
        );
      },
    ).catchError(
      (error) {
        emit(UpdateOfferClientErrorState(error.toString()));
      },
    );
  }
}
