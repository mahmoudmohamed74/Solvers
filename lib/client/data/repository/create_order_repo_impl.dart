import 'package:firebase_auth/firebase_auth.dart';
import 'package:solvers/client/data/datasource/create_order.dart';
import 'package:solvers/client/data/models/order_model.dart';
import 'package:solvers/client/domain/entities/update_order_offer.dart';
import 'package:solvers/client/domain/repository/base_create_order_repo.dart';
import 'package:solvers/solver/data/models/offer_model.dart';

class CreateOrderRepoImpl implements BaseCreateOrderRepo {
  final FireStoreCreateOrder _fireStoreCreateOrder;

  CreateOrderRepoImpl(this._fireStoreCreateOrder);

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
      print("Update Offer error repo : ${e.toString()}");
    }
  }
}
