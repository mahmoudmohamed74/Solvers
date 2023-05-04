import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:solvers/client/data/models/order_model.dart';

class FireStoreCreateOrder {
  static final _fireStoreCreateOrderCollection = FirebaseFirestore.instance;

  Future<void> addOrderToFireStore(OrderModel order) async {
    await _fireStoreCreateOrderCollection
        .collection('order')
        .add(order.toJson());
  }

  Future<List<OrderModel>?> getOrderToClientFromFireStore(
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
}
