import 'package:solvers/Auth/data/datasource/firestore_create_user.dart';
import 'package:solvers/Auth/data/models/client_model.dart';
import 'package:solvers/Auth/domain/repository/base_create_user_repo.dart';

class CreateUserRepoImpl implements BaseCreateUserRepo {
  @override
  Future<void> createClient(ClientModel client) async {
    try {
      await FireStoreCreateUser.addClientToFireStore(client);
    } catch (e) {
      print("${e.toString()} create client error ");
    }
  }
}
