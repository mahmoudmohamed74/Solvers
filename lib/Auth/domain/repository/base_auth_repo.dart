import 'package:firebase_auth/firebase_auth.dart';
import 'package:solvers/Auth/domain/entities/registered_user.dart';

abstract class BaseFirebaseAuthRepository {
  Future<User> signUp(RegisteredUser newUserInfo);
  Future<User> logIn(RegisteredUser userInfo);
  Future<void> signOut({required String userId});
}
