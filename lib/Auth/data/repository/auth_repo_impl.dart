import 'package:firebase_auth/firebase_auth.dart';

import 'package:solvers/Auth/data/datasource/firebase_auth.dart';
import 'package:solvers/Auth/domain/entities/registered_user.dart';
import 'package:solvers/Auth/domain/repository/base_auth_repo.dart';

class FirebaseAuthRepositoryImpl implements BaseFirebaseAuthRepository {
  final FirebaseAuthentication firebaseAuthentication;
  FirebaseAuthRepositoryImpl(
    this.firebaseAuthentication,
  );

  @override
  Future<User> signUp(RegisteredUser newUserInfo) async {
    try {
      User userId = await firebaseAuthentication.signUp(
        email: newUserInfo.email,
        password: newUserInfo.password,
      );
      return userId;
    } on FirebaseAuthException catch (e) {
      print("'The email address entered is already in use.'");
      return Future.error(e.message!);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<User> logIn(RegisteredUser userInfo) async {
    try {
      return await firebaseAuthentication.logIn(
        email: userInfo.email,
        password: userInfo.password,
      );
    } on FirebaseAuthException catch (e) {
      return Future.error(e.message!);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<void> signOut({required String userId}) async {
    try {
      await firebaseAuthentication.signOut();
      // await FireStoreNotification.deleteDeviceToken(userId: userId);
      return;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
