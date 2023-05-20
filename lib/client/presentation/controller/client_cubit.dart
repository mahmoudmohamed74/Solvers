// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvers/client/data/models/client_model.dart';
import 'package:solvers/Auth/presentation/controller/auth_cubit/auth_cubit.dart';

import 'package:solvers/client/data/models/order_model.dart';
import 'package:solvers/client/data/requests/update_client_data_request.dart';
import 'package:solvers/client/data/requests/update_order_offer_request.dart';
import 'package:solvers/client/domain/usecases/create_order_use_case.dart';
import 'package:solvers/client/domain/usecases/get_all_offers_use_case.dart';
import 'package:solvers/client/domain/usecases/get_client_use_case.dart';
import 'package:solvers/client/domain/usecases/get_message_use_case.dart';
import 'package:solvers/client/domain/usecases/get_order_use_case.dart';
import 'package:solvers/client/domain/usecases/send_message_use_case.dart';
import 'package:solvers/client/domain/usecases/update_client_data_use_case.dart';
import 'package:solvers/client/domain/usecases/update_order_offer_use_case.dart';
import 'package:solvers/client/presentation/screens/home_client_page.dart';
import 'package:solvers/client/presentation/screens/my_requests_client_page.dart';
import 'package:solvers/client/presentation/screens/profile_page_client.dart';
import 'package:solvers/client/presentation/screens/request_status_client_page.dart';
import 'package:solvers/core/app/app.dart';
import 'package:solvers/core/app/app_prefs.dart';
import 'package:solvers/core/messages/message_model.dart';
import 'package:solvers/core/routes/app_routes.dart';
import 'package:solvers/core/services/services_locator.dart';
import 'package:solvers/solver/data/models/offer_model.dart';
import 'package:solvers/core/utils/functions.dart';

part 'client_state.dart';

class ClientCubit extends Cubit<ClientState> {
  final CreateOrderUseCase _createOrderUseCase;
  final GetOrderToClientUseCase _getOrderToClientUseCase;
  final GetAllOffersToClientUseCase _getAllOffersToClientUseCase;
  final UpdateOrderOfferUseCase _updateOrderOfferUseCase;
  final UpdateClientDataUseCase _updateClientDataUseCase;
  final GetClientUseCase _getClientUseCase;
  final ClientSendMessageUseCase _clientSendMessageUseCase;
  final ClientGetMessagesUseCase _clientGetMessagesUseCase;
  final AppPreferences _appPreferences = sl<AppPreferences>();

  final authCubit = BlocProvider.of<FirebaseAuthCubit>;

  ClientCubit(
    this._createOrderUseCase,
    this._getOrderToClientUseCase,
    this._getAllOffersToClientUseCase,
    this._updateOrderOfferUseCase,
    this._updateClientDataUseCase,
    this._getClientUseCase,
    this._clientSendMessageUseCase,
    this._clientGetMessagesUseCase,
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

  String? clientId;

  ClientModel? clientData;

  Future<ClientModel?> getClientCubit() async {
    emit(GetClientLoading());
    clientId = await _appPreferences.getClientId();
    print("clientIdin get $clientId .......");
    return await _getClientUseCase.call(params: clientId!).then((value) async {
      clientData = value;
      if (clientData != null) {
        emit(GetClientSuccess(clientData));
      } else {
        emit(GetClientFailed("client data is null"));
      }
    }).catchError((e) {
      print("cubit error failed to retrieve client data ${e.toString()}");
      emit(GetClientError(e.toString()));
    });
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
    }).catchError(
      (error) {
        emit(GetAllOrdersErrorState(error.toString()));
        return error;
      },
    );
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
        for (var element in value) {
          if (element.accepted == '' || element.accepted == 'true') {
            clientOffers.add(element);
          } else if (element.accepted == 'true') {
            acceptedOffers.add(element);
          }
        }
        allOffers = value;
        // print("allOffers $allOffers");
        emit(GetAllOffersSuccessState(allOffersList: allOffers));
        return allOffers;
      },
    ).catchError(
      (error) {
        emit(GetAllOffersErrorState(error.toString()));
        return error;
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

  void onFirstNameFieldClicked() {
    emit(OnFirstNameClicked(true));
  }

  void onLastNameFieldClicked() {
    emit(OnLastNameClicked(true));
  }

  void onPhoneFieldClicked() {
    emit(OnPhoneClicked(true));
  }

  Future<String> validFirstName(String firstName) async {
    if (state is OnFirstNameClicked) {
      if (firstName.isNotEmpty && firstName.length >= 3) {
        emit(IsFirstNameValid(true));
        return firstName;
      } else {
        emit(IsFirstNameValid(false));
        return "";
      }
    } else {
      return "";
    }
  }

  Future<String> validLastName(String lastName) async {
    if (state is OnLastNameClicked) {
      if (lastName.isNotEmpty && lastName.length >= 3) {
        emit(IsLastNameValid(true));
        return lastName;
      } else {
        emit(IsLastNameValid(false));
        return "";
      }
    } else {
      return "";
    }
  }

  Future<String> validPhoneNumber(String phoneNumber) async {
    if (state is OnPhoneClicked) {
      if (phoneNumber.isValidPhone()) {
        emit(IsPhoneNumberValid(true));
        return phoneNumber;
      } else {
        emit(IsPhoneNumberValid(false));
        return "";
      }
    } else {
      return "";
    }
  }

  Future<void> updateClientData(
    UpdateClientDataRequest updateClientData,
    context,
  ) async {
    emit(UpdateClientDataLoadingState());
    await _updateClientDataUseCase
        .call(params: updateClientData)
        .then((value) async {
      await getClientCubit();
      emit(UpdateClientDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(UpdateClientDataErrorState());
    });
  }

  void clientSignOut({required BuildContext context}) async {
    FirebaseAuth.instance.signOut();
    _appPreferences.sharedPreferences.clear();
    // ClientCubit.get(context).close();
    runApp(MyApp());
    Navigator.pushReplacementNamed(context, Routes.userLoginRoute);
  }

  Future<void> clientSendMessage({
    required String receiverId,
    required String message,
  }) async {
    MessageModel messageModel = MessageModel(
      message: message,
      senderId: clientId,
      receiverId: receiverId,
      messageDate: DateTime.now().toString(),
    );
    await _clientSendMessageUseCase.call(params: messageModel);
  }

  void clientGetMessages(String receiverId) {
    emit(ChatLoading());
    _clientGetMessagesUseCase.execute(clientId!, receiverId).listen(
      (messages) {
        emit(ChatLoaded(messages));
      },
      onError: (error) {
        emit(ChatError(error.toString()));
      },
    );
  }
}
