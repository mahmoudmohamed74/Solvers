import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  get user => _firebaseAuth.currentUser;

  Future<User> signUp({
    required String email,
    required String password,
  }) async {
    UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = result.user!;
    return user;
  }

  Future<User> logIn({
    required String email,
    required String password,
  }) async {
    UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = result.user!;
    return user;
  }

  Future signOut() async => await _firebaseAuth.signOut();

  Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
