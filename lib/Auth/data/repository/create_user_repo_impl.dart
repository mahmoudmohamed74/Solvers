import 'package:solvers/Auth/data/datasource/firestore_create_user.dart';
import 'package:solvers/Auth/data/models/client_model.dart';
import 'package:solvers/Auth/domain/repository/base_create_user_repo.dart';

class CreateUserRepoImpl implements BaseCreateUserRepo {
  final FireStoreCreateUser fireStoreCreateUser;

  CreateUserRepoImpl(this.fireStoreCreateUser);
  @override
  Future<void> createClient(ClientModel client) async {
    try {
      await fireStoreCreateUser.addClientToFireStore(client);
    } catch (e) {
      print("${e.toString()} create client error ");
    }
  }

  // @override
  // Future<ClientModel?> getClient(String clientId) async {
  //   try {
  //     final clientInfo = await fireStoreCreateUser.getClient(clientId);
  //     return clientInfo;
  //   } catch (e) {
  //     print("${e.toString()} create client error ");
  //     return null;
  //   }
  // }

}
