import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreUserInfo {
  static final _fireStoreUserCollection =
      FirebaseFirestore.instance.collection('users');
}
