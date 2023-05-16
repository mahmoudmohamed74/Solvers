import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:solvers/Auth/data/models/client_model.dart';
import 'package:solvers/Auth/data/models/tech_model.dart';

class FireStoreCreateUser {
  static final _fireStoreUserCollection = FirebaseFirestore.instance;

  Future<void> addClientToFireStore(ClientModel client) async {
    await _fireStoreUserCollection
        .collection('client')
        .doc(client.clientId)
        .set(client.toJson());
  }

  Future<void> addTechToFireStore(TechModel tech) async {
    await _fireStoreUserCollection
        .collection('technician')
        .doc(tech.techId)
        .set(tech.toJson());
  }

  Future<String> checkUser(String userId) async {
    String userType;

    DocumentSnapshot<Map<String, dynamic>> clientSnapshot =
        await _fireStoreUserCollection.collection('client').doc(userId).get();

    DocumentSnapshot<Map<String, dynamic>> techSnapshot =
        await _fireStoreUserCollection
            .collection('technician')
            .doc(userId)
            .get();

    if (clientSnapshot.exists) {
      userType = "client";
      return userType;
    } else if (techSnapshot.exists) {
      userType = "technician";
      return userType;
    } else {
      return "";
    }
  }
}
