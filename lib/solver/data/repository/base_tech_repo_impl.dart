import 'package:firebase_auth/firebase_auth.dart';
import 'package:solvers/client/data/models/order_model.dart';
import 'package:solvers/solver/data/datasource/technician_firestore.dart';
import 'package:solvers/solver/data/models/offer_model.dart';
import 'package:solvers/solver/data/requests/update_tech_data_request.dart';
import 'package:solvers/solver/domain/repository/base_tech_repo.dart';

class TechRepoImpl implements BaseTechRepo {
  final FireStoreTechnician _fireStoreTechnician;

  TechRepoImpl(this._fireStoreTechnician);
  @override
  Future<void> declineOrder(
    String orderDocId,
    String techId,
  ) async {
    try {
      await _fireStoreTechnician.declineOrder(
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
      await _fireStoreTechnician.createOffer(offerModel, orderDocId);
    } catch (e) {
      print("create offer repo error : ${e.toString()}");
    }
  }

  @override
  Future<List<OrderModel>> getOrderToTech(String techId) async {
    try {
      return await _fireStoreTechnician.getOrderToTechFromFireStore(
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

  @override
  Future<List<OrderModel>> getAcceptedOrders(String techId) async {
    try {
      return await _fireStoreTechnician.getAcceptedOrdersToTech(
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

  @override
  Future<void> updateTechData(UpdateTechDataRequest techData) async {
    try {
      await _fireStoreTechnician.updateTechData(
        techId: techData.techId,
        firstName: techData.firstName,
        lastName: techData.lastName,
        phoneNumber: techData.phoneNumber,
        skills: techData.skills,
      );
    } catch (e) {
      print("Update tech data repo error: ${e.toString()}");
    }
  }
}
