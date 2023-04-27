import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  // Future<ClientModel?> getClient(String clientId) async {
  //   DocumentSnapshot snapshot =
  //       await _fireStoreUserCollection.collection('client').doc(clientId).get();
  //   Map<String, dynamic> clientData = snapshot.data()! as Map<String, dynamic>;

  //   if (snapshot.exists) {
  //     return ClientModel(
  //       firstName: snapshot.get("firstName"),
  //       lastName: snapshot.get("lastName"),
  //       email: snapshot.get("email"),
  //       clientId: snapshot.get("clientId"),
  //       phoneNumber: snapshot.get("phoneNumber"),
  //     );
  //   } else {
  //     return null;
  //   }
  // }

  // Future<TechModel?> getTech(String techId) async {
  //   DocumentSnapshot snapshot = await _fireStoreUserCollection
  //       .collection('technician')
  //       .doc(techId)
  //       .get();
  //   Map<String, dynamic> techData = snapshot.data()! as Map<String, dynamic>;
  //   if (snapshot.exists) {
  //     return TechModel.fromJson(techData);
  //   } else {
  //     return null;
  //   }
  // }

}
