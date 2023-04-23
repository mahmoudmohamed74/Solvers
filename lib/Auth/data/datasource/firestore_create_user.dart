import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:solvers/Auth/data/models/client_model.dart';

class FireStoreCreateUser {
  static final _fireStoreClientCollection = FirebaseFirestore.instance;

  static Future<void> addClientToFireStore(ClientModel client) async {
    await _fireStoreClientCollection
        .collection('client')
        .doc(client.clientId)
        .set(client.toJson());
  }

//  static Future<User?> getUser(String userId) async {
//     DocumentSnapshot snapshot = await firestore.collection('users').doc(userId).get();

//     if (snapshot.exists) {
//       return User(
//         name: snapshot.data()['name'],
//         email: snapshot.data()['email'],
//         userId: snapshot.data()['userId'],
//         phoneNumber: snapshot.data()['phoneNumber'],
//       );
//     } else {
//       return null;
//     }
//   }

}
