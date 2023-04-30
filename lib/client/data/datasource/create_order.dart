import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:solvers/client/data/models/order_model.dart';

class FireStoreCreateOrder {
  static final _fireStoreCreateOrderCollection = FirebaseFirestore.instance;

  Future<void> addOrderToFireStore(OrderModel order) async {
    await _fireStoreCreateOrderCollection
        .collection('order')
        .doc(order.clientId)
        .set(order.toJson());
  }
}
