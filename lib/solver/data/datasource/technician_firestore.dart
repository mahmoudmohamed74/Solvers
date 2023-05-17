import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:solvers/Auth/data/models/tech_model.dart';
import 'package:solvers/client/data/models/order_model.dart';
import 'package:solvers/core/messages/message_model.dart';
import 'package:solvers/solver/data/models/offer_model.dart';

class TechnicianFireStore {
  static final _fireStoreTechCollection = FirebaseFirestore.instance;

  Future<TechModel?> getTech(String techId) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _fireStoreTechCollection
            .collection('technician')
            .doc(techId)
            .get();
    Map<String, dynamic> techData = snapshot.data()!;
    if (snapshot.exists) {
      return TechModel.fromJson(techData);
    } else {
      return null;
    }
  }

  Future<void> createOffer(OfferModel offerModel, String orderDocId) async {
    await _fireStoreTechCollection
        .collection("order")
        .doc(orderDocId)
        .collection("offer")
        .doc(offerModel.techId)
        .set(offerModel.toJson());
  }

  Future<List<OrderModel>> getOrderToTechFromFireStore(
    String techId,
  ) async {
    DocumentSnapshot<Map<String, dynamic>> technicianDoc =
        await _fireStoreTechCollection
            .collection('technician')
            .doc(techId)
            .get();
    final skills = List<String>.from(technicianDoc.data()?['skills'] ?? []);

    // print("skills $skills");
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _fireStoreTechCollection
            .collection('order')
            .where(
              'mainProblem',
              arrayContainsAny: skills,
            )
            .get();

    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs
          .map((doc) => OrderModel.fromJson(doc.data()))
          .toList();
    } else {
      return [];
    }
  }

  Future<List<OrderModel>> getAcceptedOrdersToTech(
    String techId,
  ) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _fireStoreTechCollection
            .collection('order')
            .where('techId', isEqualTo: techId)
            .get();

    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs
          .map((doc) => OrderModel.fromJson(doc.data()))
          .toList();
    } else {
      return [];
    }
  }

  Future<void> declineOrder(
    String orderDocId,
    String techId,
  ) async {
    await _fireStoreTechCollection.collection('order').doc(orderDocId).update(
      {
        'refusedIds': FieldValue.arrayUnion([techId]),
      },
    );
  }

  Future<void> updateTechData({
    required String techId,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required List<String> skills,
  }) async {
    final techDoc =
        _fireStoreTechCollection.collection("technician").doc(techId);

    if (firstName != "") {
      await techDoc.update({'firstName': firstName});
    }
    if (lastName != "") {
      await techDoc.update({'lastName': lastName});
    }
    if (phoneNumber != "") {
      await techDoc.update({'phoneNumber': phoneNumber});
    }
    if (skills.isNotEmpty) {
      techDoc.set(
        {
          'skills': skills,
        },
        SetOptions(merge: true),
      );
    }
  }

  Future<void> techSendMessage(MessageModel messageModel) async {
    await _fireStoreTechCollection
        .collection("technician")
        .doc(messageModel.senderId)
        .collection('chat')
        .doc(messageModel.receiverId)
        .collection("messages")
        .add(messageModel.toJson());
    debugPrint("Message saved in sender successfully ......");
    await _fireStoreTechCollection
        .collection("client")
        .doc(messageModel.receiverId)
        .collection('chat')
        .doc(messageModel.senderId)
        .collection("messages")
        .add(messageModel.toJson());
    debugPrint("Message saved in receiver successfully ......");
  }

  Stream<List<MessageModel>> techGetMessages(
    String senderId,
    String receiverId,
  ) {
    return _fireStoreTechCollection
        .collection("technician")
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
