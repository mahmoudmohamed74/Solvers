import 'package:firebase_auth/firebase_auth.dart';
import 'package:solvers/Auth/data/datasource/firestore_create_user.dart';
import 'package:solvers/Auth/data/models/tech_model.dart';
import 'package:solvers/Auth/data/models/client_model.dart';
import 'package:solvers/Auth/domain/repository/base_create_user_repo.dart';

class CreateUserRepoImpl implements BaseCreateUserRepo {
  final FireStoreCreateUser fireStoreCreateUser;

  CreateUserRepoImpl(this.fireStoreCreateUser);

  @override
  Future<String> checkUser(String userId) async {
    try {
      final userType = await fireStoreCreateUser.checkUser(userId);
      return userType;
    } on FirebaseException catch (e) {
      print('FirebaseException while fetching user: ${e.message}');
      return Future.error(e.message!);
    } catch (e) {
      print('Unknown error while fetching user: $e');
      return "";
    }
  }

  @override
  Future<void> createClient(ClientModel client) async {
    try {
      await fireStoreCreateUser.addClientToFireStore(client);
    } catch (e) {
      print("${e.toString()} create client error ");
    }
  }

  @override
  Future<void> createTech(TechModel tech) async {
    try {
      await fireStoreCreateUser.addTechToFireStore(tech);
    } catch (e) {
      print("${e.toString()} create technician error ");
    }
  }
}
