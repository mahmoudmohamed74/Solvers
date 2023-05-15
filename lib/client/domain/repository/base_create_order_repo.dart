import 'package:solvers/client/data/models/order_model.dart';
import 'package:solvers/client/data/requests/update_client_data_request.dart';
import 'package:solvers/client/data/requests/update_order_offer_request.dart';
import 'package:solvers/solver/data/models/offer_model.dart';

abstract class BaseClientRepo {
  Future<void> createOrder(OrderModel orderModel);
  Future<List<OrderModel>> getOrderToClient(String clientId);
  Future<List<OfferModel>> getOrderAllOffersTOClient(String orderDocId);
  Future<void> updateOrderOffer(UpdateOrderOffer updateOrderOffer);
  Future<void> updateClientData(UpdateClientDataRequest updateClientData);
}
