import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvers/Auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:solvers/client/data/models/order_model.dart';
import 'package:solvers/solver/data/models/offer_model.dart';
import 'package:solvers/solver/domain/usecases/create_offer_use_case.dart';
import 'package:solvers/solver/domain/usecases/get_order_to_tech_use_case.dart';
import 'package:solvers/solver/domain/usecases/update_order_accepted_type_use_case.dart';
import 'package:solvers/solver/presentation/screens/home_tech_page.dart';
import 'package:solvers/solver/presentation/screens/my_request_tech_page.dart';
import 'package:solvers/solver/presentation/screens/profile_page_tech.dart';
import 'package:solvers/solver/presentation/screens/request_status_tech_page.dart';

part 'tech_state.dart';

class TechCubit extends Cubit<TechState> {
  final GetOrderToTechUseCase _getOrderToTechUseCase;
  final CreateOfferUseCase _createOfferUseCase;
  final UpdateOrderAcceptedTypeUseCase _updateOrderAcceptedTypeUseCase;
  TechCubit(
    this._getOrderToTechUseCase,
    this._createOfferUseCase,
    this._updateOrderAcceptedTypeUseCase,
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

  List<OrderModel> orderTech = [];
  List<OrderModel> acceptedOrders = [];
  List<OrderModel> allOrders = [];
  Future<List<OrderModel>> getOrderTech(String techId) async {
    allOrders = [];
    orderTech = [];
    allOrders = [];

    emit(GetAllOrderTechLoadingState());
    return await _getOrderToTechUseCase.call(params: techId).then((value) {
      value.forEach((element) {
        if (element.accepted == "" || element.accepted == "true") {
          orderTech.add(element);
        }
        if (element.accepted == "true") {
          acceptedOrders.add(element);
        }
      });

      allOrders = value;
      // print("orderTech $orderTech");
      // print("acceptedOrders $acceptedOrders");
      // print("orderRequestList $orderTech");

      emit(GetAllOrderTechSuccessState(allOrders));
      return allOrders;
    }).catchError((error) {
      emit(GetAllOrderTechErrorState(error));
    });
  }

  Future<void> updateOrderAccepted(
    context,
    String orderDocId,
    String acceptedType,
  ) async {
    emit(UpdateOrderTechLoadingState());
    await _updateOrderAcceptedTypeUseCase
        .call(paramsOne: orderDocId, paramsTwo: acceptedType)
        .then((value) {
      getOrderTech(FirebaseAuthCubit.get(context).techData!.techId);

      emit(UpdateOrderTechSuccessState(orderTech));
    }).catchError(
      (error) {
        emit(UpdateOrderTechErrorState(error.toString()));
        print("Cubit Update offer error: ${error.toString()}");
      },
    );
  }
}
