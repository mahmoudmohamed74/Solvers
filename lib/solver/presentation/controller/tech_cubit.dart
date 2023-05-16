import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvers/Auth/data/models/tech_model.dart';
import 'package:solvers/Auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:solvers/client/data/models/order_model.dart';
import 'package:solvers/core/app/app_prefs.dart';
import 'package:solvers/core/services/services_locator.dart';
import 'package:solvers/core/utils/functions.dart';
import 'package:solvers/solver/data/datasource/technician_firestore.dart';
import 'package:solvers/solver/data/models/offer_model.dart';
import 'package:solvers/solver/data/requests/update_tech_data_request.dart';
import 'package:solvers/solver/domain/usecases/create_offer_use_case.dart';
import 'package:solvers/solver/domain/usecases/get_accepted_orders_use_case.dart';
import 'package:solvers/solver/domain/usecases/get_order_to_tech_use_case.dart';
import 'package:solvers/solver/domain/usecases/get_tech_use_case.dart';
import 'package:solvers/solver/domain/usecases/update_order_accepted_type_use_case.dart';
import 'package:solvers/solver/domain/usecases/update_tech_data_use_case.dart';
import 'package:solvers/solver/presentation/screens/home_tech_page.dart';
import 'package:solvers/solver/presentation/screens/my_request_tech_page.dart';
import 'package:solvers/solver/presentation/screens/profile_page_tech.dart';
import 'package:solvers/solver/presentation/screens/request_status_tech_page.dart';

part 'tech_state.dart';

class TechCubit extends Cubit<TechState> {
  final GetTechUseCase _getTechUseCase;
  final GetOrderToTechUseCase _getOrderToTechUseCase;
  final CreateOfferUseCase _createOfferUseCase;
  final UpdateOrderAcceptedTypeUseCase _updateOrderAcceptedTypeUseCase;
  final GetAcceptedOrdersUseCase _getAcceptedOrdersUseCase;
  final UpdateTechDataUseCase _updateTechDataUseCase;
  final AppPreferences _appPreferences = sl<AppPreferences>();
  final TechnicianFireStore _fireStoreTechnician;
  TechCubit(
    this._fireStoreTechnician,
    this._getTechUseCase,
    this._getOrderToTechUseCase,
    this._createOfferUseCase,
    this._updateOrderAcceptedTypeUseCase,
    this._getAcceptedOrdersUseCase,
    this._updateTechDataUseCase,
  ) : super(TechInitial());

  static TechCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    const TechHomePage(),
    const TechMyRequestPage(),
    const TechRequestStatusPage(),
    TechProfilePage(),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavStates());
  }

  String? techId;

  TechModel? techData;
  Future<TechModel?> getTechCubit() async {
    emit(GetTechLoading());
    techId = await _appPreferences.getTechnicianId();
    return await _getTechUseCase.call(params: techId!).then((value) async {
      techData = value;
      if (techData != null) {
        emit(GetTechSuccess(techData));
      } else {
        emit(GetTechFailed("technician data is null"));
      }
    }).catchError((e) {
      print("cubit error failed to retrieve tech data ${e.toString()}");
      emit(GetTechError(e.toString()));
    });
  }

  Future<void> createOffer(
    OfferModel offerModel,
    String orderDocId,
  ) async {
    emit(CreateOfferLoadingState());
    await _createOfferUseCase
        .call(paramsOne: offerModel, paramsTwo: orderDocId)
        .then((value) {
      emit(CreateOfferSuccessState());
    }).catchError((error) {
      emit(CreateOfferErrorState(error));
    });
  }

  List<OrderModel> allOrders = [];
  List<OrderModel> orderTech = [];
  Future<List<OrderModel>> getOrderTech(String techId) async {
    allOrders = [];
    orderTech = [];

    emit(GetAllOrderTechLoadingState());
    return await _getOrderToTechUseCase.call(params: techId).then((value) {
      value.forEach((element) {
        if (element.status == 'new' && !element.refusedIds.contains(techId)) {
          orderTech.add(element);
        }
      });

      allOrders = value;

      emit(GetAllOrderTechSuccessState(allOrders));
      return allOrders;
    }).catchError((error) {
      emit(GetAllOrderTechErrorState(error));
    });
  }

  List<OrderModel> acceptedOrders = [];

  Future<List<OrderModel>> getAcceptedOrders(String techId) async {
    acceptedOrders = [];
    emit(GetAcceptedOrdersLoadingState());
    return await _getAcceptedOrdersUseCase.call(params: techId).then((value) {
      acceptedOrders = value;
      emit(GetAcceptedOrdersSuccessState(acceptedOrders));
      return acceptedOrders;
    }).catchError((error) {
      print(error.toString());
      emit(GetAcceptedOrdersErrorState(error));
    });
  }

  Future<void> declineOrder(
    context,
    String orderDocId,
    String techId,
  ) async {
    emit(UpdateOrderTechLoadingState());
    await _updateOrderAcceptedTypeUseCase
        .call(paramsOne: orderDocId, paramsTwo: techId)
        .then((value) async {
      await getOrderTech(techId);

      emit(UpdateOrderTechSuccessState(orderTech));
    }).catchError(
      (error) {
        emit(UpdateOrderTechErrorState(error.toString()));
        print("Cubit Update offer error: ${error.toString()}");
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

  Future<void> updateTechData(
    UpdateTechDataRequest updateTechData,
    context,
  ) async {
    emit(UpdateTechDataLoadingState());
    await _updateTechDataUseCase
        .call(params: updateTechData)
        .then((value) async {
      await getTechCubit();
      emit(UpdateTechDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(UpdateTechDataErrorState());
    });
  }
}
