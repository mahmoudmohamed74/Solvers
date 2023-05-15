import 'package:firebase_auth/firebase_auth.dart';
import 'package:solvers/client/data/datasource/client_firestore.dart';
import 'package:solvers/client/data/models/order_model.dart';
import 'package:solvers/client/data/requests/update_client_data_request.dart';
import 'package:solvers/client/data/requests/update_order_offer_request.dart';
import 'package:solvers/client/domain/repository/base_create_order_repo.dart';
import 'package:solvers/solver/data/models/offer_model.dart';

class ClientRepoImpl implements BaseClientRepo {
  final FireStoreCreateOrder _fireStoreCreateOrder;

  ClientRepoImpl(this._fireStoreCreateOrder);

  @override
  Future<void> createOrder(OrderModel order) async {
    try {
      await _fireStoreCreateOrder.addOrderToFireStore(order);
    } catch (e) {
      print("create order error repo : ${e.toString()}");
    }
  }

  @override
  Future<List<OrderModel>> getOrderToClient(String clientId) async {
    try {
      return await _fireStoreCreateOrder.getOrderToClientFromFireStore(
        clientId,
      );
    } on FirebaseException catch (e) {
      print('FirebaseException while fetching orders: ${e.message}');
      return [];
    } catch (e) {
      print('Unknown error while fetching orders: $e');
      return [];
    }
  }

  @override
  Future<List<OfferModel>> getOrderAllOffersTOClient(String orderDocId) async {
    try {
      return await _fireStoreCreateOrder.getAllOffersToClient(
        orderDocId,
      );
    } on FirebaseException catch (e) {
      print('FirebaseException while fetching offers: ${e.message}');
      return [];
    } catch (e) {
      print('Unknown error while fetching offers: $e');
      return [];
    }
  }

  @override
  Future<void> updateOrderOffer(
    UpdateOrderOffer updateOrderOffer,
  ) async {
    try {
      await _fireStoreCreateOrder.updateOffer(
        orderDocId: updateOrderOffer.orderDocId,
        status: updateOrderOffer.status,
        techName: updateOrderOffer.techName,
        price: updateOrderOffer.price,
        earnest: updateOrderOffer.earnest,
        techId: updateOrderOffer.techId,
        isAcceptedOffer: updateOrderOffer.isAcceptedOffer,
      );
    } catch (e) {
      print("Update Offer repo error: ${e.toString()}");
    }
  }

  @override
  Future<void> updateClientData(
      UpdateClientDataRequest updateClientData) async {
    try {
      await _fireStoreCreateOrder.updateClientData(
        clientId: updateClientData.clientId,
        firstName: updateClientData.firstName,
        lastName: updateClientData.lastName,
        phoneNumber: updateClientData.phoneNumber,
      );
    } catch (e) {
      print("Update client data repo error: ${e.toString()}");
    }
  }
}
