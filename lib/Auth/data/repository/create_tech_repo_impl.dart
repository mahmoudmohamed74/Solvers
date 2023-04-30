import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:solvers/Auth/data/datasource/firestore_create_user.dart';
import 'package:solvers/Auth/data/models/tech_model.dart';
import 'package:solvers/Auth/domain/repository/base_create_user_repo.dart';

class CreateTechRepoImpl implements BaseCreateTechRepo {
  final FireStoreCreateUser fireStoreCreateUser;

  CreateTechRepoImpl(this.fireStoreCreateUser);

  @override
  Future<void> createTech(TechModel tech) async {
    try {
      await fireStoreCreateUser.addTechToFireStore(tech);
    } catch (e) {
      print("${e.toString()} create technician error ");
    }
  }

  @override
  Future<TechModel?> getTech(String techId) async {
    try {
      final techInfo = await fireStoreCreateUser.getTech(techId);
      return techInfo;
    } on FirebaseException catch (e) {
      print('FirebaseException while fetching technician: ${e.message}');
      return Future.error(e.message!);
    } catch (e) {
      print('Unknown error while fetching technician: $e');
      return null;
    }
  }
}
