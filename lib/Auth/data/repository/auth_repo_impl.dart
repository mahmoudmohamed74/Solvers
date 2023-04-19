import 'package:firebase_auth/firebase_auth.dart';
import 'package:solvers/Auth/data/datasource/firebase_auth.dart';
import 'package:solvers/Auth/domain/entities/registered_user.dart';
import 'package:solvers/Auth/domain/repository/base_auth_repo.dart';

class FirebaseAuthRepositoryImpl implements BaseFirebaseAuthRepository {
  @override
  Future<User> signUp(RegisteredUser newUserInfo) async {
    try {
      User userId = await FirebaseAuthentication.signUp(
        email: newUserInfo.email,
        password: newUserInfo.password,
      );
      return userId;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<User> logIn(RegisteredUser userInfo) async {
    try {
      return await FirebaseAuthentication.logIn(
        email: userInfo.email,
        password: userInfo.password,
      );
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<void> signOut({required String userId}) async {
    try {
      await FirebaseAuthentication.signOut();
      // await FireStoreNotification.deleteDeviceToken(userId: userId);
      return;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
