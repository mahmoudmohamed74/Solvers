import 'package:firebase_auth/firebase_auth.dart';
import 'package:solvers/client/data/models/order_model.dart';
import 'package:solvers/solver/data/datasource/get_order.dart';
import 'package:solvers/solver/data/models/offer_model.dart';
import 'package:solvers/solver/domain/repository/base_tech_repo.dart';

class TechRepoImpl implements BaseTechRepo {
  final FireStoreGetOrderToTech _fireStoreGetOrderToTech;

  TechRepoImpl(this._fireStoreGetOrderToTech);
  @override
  Future<void> declineOrder(
    String orderDocId,
    String techId,
  ) async {
    try {
      await _fireStoreGetOrderToTech.declineOrder(
        orderDocId,
        techId,
      );
    } catch (e) {
      print("Update Order error repo : ${e.toString()}");
    }
  }

  @override
  Future<void> createOffer(OfferModel offerModel, String orderDocId) async {
    try {
      await _fireStoreGetOrderToTech.createOffer(offerModel, orderDocId);
    } catch (e) {
      print("create offer error repo : ${e.toString()}");
    }
  }

  @override
  Future<List<OrderModel>> getOrderToTech(String techId) async {
    try {
      return await _fireStoreGetOrderToTech.getOrderToTechFromFireStore(
        techId,
      );
    } on FirebaseException catch (e) {
      print('FirebaseException while fetching orders: ${e.message}');
      return [];
    } catch (e) {
      print('Unknown error while fetching orders: $e');
      return [];
    }
  }
}
