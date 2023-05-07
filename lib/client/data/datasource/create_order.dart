import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:solvers/client/data/models/order_model.dart';
import 'package:solvers/solver/data/models/offer_model.dart';

class FireStoreCreateOrder {
  static final _fireStoreCreateOrderCollection = FirebaseFirestore.instance;

  Future<void> addOrderToFireStore(OrderModel order) async {
    CollectionReference ordersCollection =
        _fireStoreCreateOrderCollection.collection('order');
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
        await _fireStoreCreateOrderCollection
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
        await _fireStoreCreateOrderCollection
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

  Future<void> updateOfferAcceptedType(
    String orderDocId,
    String techId,
    String acceptedType,
  ) async {
    await _fireStoreCreateOrderCollection
        .collection('order')
        .doc(orderDocId)
        .collection('offer')
        .doc(techId)
        .update({'accepted': acceptedType});
  }
}
