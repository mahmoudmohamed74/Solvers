import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:solvers/client/data/models/order_model.dart';
import 'package:solvers/solver/data/models/offer_model.dart';

class FireStoreTechnician {
  static final _fireStoreTechCollection = FirebaseFirestore.instance;

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
}