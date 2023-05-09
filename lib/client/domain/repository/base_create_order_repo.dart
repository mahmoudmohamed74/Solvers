import 'package:solvers/client/data/models/order_model.dart';
import 'package:solvers/client/domain/entities/update_order_offer.dart';
import 'package:solvers/solver/data/models/offer_model.dart';

abstract class BaseCreateOrderRepo {
  Future<void> createOrder(OrderModel orderModel);
  Future<List<OrderModel>> getOrderToClient(String clientId);
  Future<List<OfferModel>> getOrderAllOffersTOClient(String orderDocId);
  Future<void> updateOrderOffer(
    UpdateOrderOffer updateOrderOffer,
  );
}
