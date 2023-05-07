import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:solvers/client/data/models/order_model.dart';
import 'package:solvers/solver/data/models/offer_model.dart';

class FireStoreGetOrderToTech {
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
            .where('mainProblem', arrayContainsAny: skills)
            .get();

    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs
          .map((doc) => OrderModel.fromJson(doc.data()))
          .toList();
    } else {
      return [];
    }
  }

  Future<void> updateOrderAcceptedType(
    String orderDocId,
    String accepted,
  ) async {
    await _fireStoreTechCollection
        .collection('order')
        .doc(orderDocId)
        .update({'accepted': accepted});
  }
}
