import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:solvers/client/data/models/client_model.dart';
import 'package:solvers/client/data/models/order_model.dart';
import 'package:solvers/core/messages/message_model.dart';
import 'package:solvers/solver/data/models/offer_model.dart';

class ClientFireStore {
  static final _fireStoreClientCollection = FirebaseFirestore.instance;

  Future<ClientModel?> getClient(String clientId) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _fireStoreClientCollection
            .collection('client')
            .doc(clientId)
            .get();
    Map<String, dynamic> clientData = snapshot.data()!;
    if (snapshot.exists) {
      return ClientModel.fromJson(clientData);
    } else {
      return null;
    }
  }

  Future<void> addOrderToFireStore(OrderModel order) async {
    CollectionReference ordersCollection =
        _fireStoreClientCollection.collection('order');
    DocumentReference newOrderRef = ordersCollection.doc();
    String newOrderId = newOrderRef.id;

    order = OrderModel(
      clientName: order.clientName,
      clientId: order.clientId,
      dateTime: order.dateTime,
      mainProblem: order.mainProblem,
      specificProblem: order.specificProblem,
      problemDescription: order.problemDescription,
      orderId: order.orderId,
      orderDocId: newOrderId,
    );

    await newOrderRef.set(order.toJson());
  }

  Future<List<OrderModel>> getOrderToClientFromFireStore(
    String clientId,
  ) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _fireStoreClientCollection
            .collection('order')
            .where('clientId', isEqualTo: clientId)
            .get();

    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs
          .map((doc) => OrderModel.fromJson(doc.data()))
          .toList();
    } else {
      return [];
    }
  }

  Future<List<OfferModel>> getAllOffersToClient(String orderDocId) async {
    QuerySnapshot<Map<String, dynamic>> offerSnapshot =
        await _fireStoreClientCollection
            .collection('order')
            .doc(orderDocId)
            .collection('offer')
            .get();
    if (offerSnapshot.docs.isNotEmpty) {
      return offerSnapshot.docs.map((doc) {
        return OfferModel.fromJson(doc.data());
      }).toList();
    } else {
      return [];
    }
  }

  Future<void> updateOffer({
    required String orderDocId,
    required String status,
    required String techName,
    required String price,
    required String earnest,
    required String techId,
    required String isAcceptedOffer,
    required String priceIsPaid,
    required String earnestIsPaid,
  }) async {
    await _fireStoreClientCollection
        .collection('order')
        .doc(orderDocId)
        .collection('offer')
        .doc(techId)
        .update(
      {
        'accepted': isAcceptedOffer,
      },
    );
    await _fireStoreClientCollection.collection('order').doc(orderDocId).update(
      {
        'techName': techName,
        'techId': techId,
        'status': status,
        'price': price,
        'earnest': earnest,
        "priceIsPaid": priceIsPaid,
        "earnestIsPaid": earnestIsPaid,
      },
    );
  }

  Future<void> updateClientData({
    required String clientId,
    required String firstName,
    required String lastName,
    required String phoneNumber,
  }) async {
    final clientDoc =
        _fireStoreClientCollection.collection("client").doc(clientId);
    if (firstName != "") {
      await clientDoc.update({'firstName': firstName});
    }
    if (lastName != "") {
      await clientDoc.update({'lastName': lastName});
    }
    if (phoneNumber != "") {
      await clientDoc.update({'phoneNumber': phoneNumber});
    }
  }

  Future<void> clientSendMessage(MessageModel messageModel) async {
    await _fireStoreClientCollection
        .collection("client")
        .doc(messageModel.senderId)
        .collection('chat')
        .doc(messageModel.receiverId)
        .collection("messages")
        .add(messageModel.toJson());
    debugPrint("Message saved in sender successfully ......");
    await _fireStoreClientCollection
        .collection("technician")
        .doc(messageModel.receiverId)
        .collection('chat')
        .doc(messageModel.senderId)
        .collection("messages")
        .add(messageModel.toJson());
    debugPrint("Message saved in receiver successfully ......");
  }

  Stream<List<MessageModel>> clientGetMessage(
    String senderId,
    String receiverId,
  ) {
    return _fireStoreClientCollection
        .collection("client")
        .doc(senderId)
        .collection('chat')
        .doc(receiverId)
        .collection("messages")
        .orderBy("messageDate")
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs
            .map((doc) => MessageModel.fromJson(doc.data()))
            .toList());
  }
}
