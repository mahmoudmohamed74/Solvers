// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:solvers/client/data/models/client_model.dart';
import 'package:solvers/client/data/datasource/client_firestore.dart';
import 'package:solvers/client/data/models/order_model.dart';
import 'package:solvers/client/data/requests/update_client_data_request.dart';
import 'package:solvers/client/data/requests/update_order_offer_request.dart';
import 'package:solvers/client/domain/repository/base_client_repo.dart';
import 'package:solvers/core/messages/message_model.dart';
import 'package:solvers/solver/data/models/offer_model.dart';

class ClientRepoImpl implements BaseClientRepo {
  final ClientFireStore _clientFireStore;

  ClientRepoImpl(this._clientFireStore);

  @override
  Future<void> createOrder(OrderModel order) async {
    try {
      await _clientFireStore.addOrderToFireStore(order);
    } catch (e) {
      print("create order error repo : ${e.toString()}");
    }
  }

  @override
  Future<List<OrderModel>> getOrderToClient(String clientId) async {
    try {
      return await _clientFireStore.getOrderToClientFromFireStore(
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
      return await _clientFireStore.getAllOffersToClient(
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
      await _clientFireStore.updateOffer(
        orderDocId: updateOrderOffer.orderDocId,
        status: updateOrderOffer.status,
        techName: updateOrderOffer.techName,
        price: updateOrderOffer.price,
        earnest: updateOrderOffer.earnest,
        techId: updateOrderOffer.techId,
        isAcceptedOffer: updateOrderOffer.isAcceptedOffer,
        earnestIsPaid: updateOrderOffer.earnestIsPaid,
        priceIsPaid: updateOrderOffer.priceIsPaid,
      );
    } catch (e) {
      print("Update Offer repo error: ${e.toString()}");
    }
  }

  @override
  Future<void> updateClientData(
    UpdateClientDataRequest updateClientData,
  ) async {
    try {
      await _clientFireStore.updateClientData(
        clientId: updateClientData.clientId,
        firstName: updateClientData.firstName,
        lastName: updateClientData.lastName,
        phoneNumber: updateClientData.phoneNumber,
      );
    } catch (e) {
      print("Update client data repo error: ${e.toString()}");
    }
  }

  @override
  Future<ClientModel?> getClient(String clientId) async {
    try {
      final clientInfo = await _clientFireStore.getClient(clientId);
      return clientInfo;
    } on FirebaseException catch (e) {
      print('FirebaseException while fetching client: ${e.message}');
      return Future.error(e.message!);
    } catch (e) {
      print('Unknown error while fetching client: $e');
      return null;
    }
  }

  @override
  Future<void> clientSendMessage(MessageModel messageModel) async {
    try {
      await _clientFireStore.clientSendMessage(messageModel);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Stream<List<MessageModel>> clientGetMessage(
    String senderId,
    String receiverId,
  ) {
    return _clientFireStore.clientGetMessage(senderId, receiverId);
  }
}
