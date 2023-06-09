import 'package:solvers/solver/data/models/tech_model.dart';
import 'package:solvers/client/data/models/order_model.dart';
import 'package:solvers/core/messages/message_model.dart';
import 'package:solvers/solver/data/models/offer_model.dart';
import 'package:solvers/solver/data/requests/update_tech_data_request.dart';

abstract class BaseTechRepo {
  Future<TechModel?> getTech(String techId);
  Future<List<OrderModel>> getOrderToTech(String techId);
  Future<List<OrderModel>> getAcceptedOrders(String techId);

  Future<void> createOffer(
    OfferModel offerModel,
    String orderDocId,
  );

  Future<void> declineOrder(
    String orderDocId,
    String techId,
  );
  Future<void> updateTechData(UpdateTechDataRequest techData);

  Future<void> techSendMessage(MessageModel messageModel);
  Stream<List<MessageModel>> techGetMessage(
    String senderId,
    String receiverId,
  );
}
