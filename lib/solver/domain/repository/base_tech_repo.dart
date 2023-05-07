import 'package:solvers/client/data/models/order_model.dart';
import 'package:solvers/solver/data/models/offer_model.dart';

abstract class BaseTechRepo {
  Future<List<OrderModel>> getOrderToTech(String techId);

  Future<void> createOffer(
    OfferModel offerModel,
    String orderDocId,
  );

  Future<void> updateOrderAcceptedType(
    String orderDocId,
    String acceptedType,
  );
}
