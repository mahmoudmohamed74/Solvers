import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:solvers/Auth/data/datasource/firestore_create_user.dart';
import 'package:solvers/Auth/data/models/client_model.dart';
import 'package:solvers/Auth/domain/repository/base_create_user_repo.dart';

class CreateClientRepoImpl implements BaseCreateClientRepo {
  final FireStoreCreateUser fireStoreCreateUser;

  CreateClientRepoImpl(this.fireStoreCreateUser);
  @override
  Future<void> createClient(ClientModel client) async {
    try {
      await fireStoreCreateUser.addClientToFireStore(client);
    } catch (e) {
      print("${e.toString()} create client error ");
    }
  }

  @override
  Future<ClientModel?> getClient(String clientId) async {
    try {
      final clientInfo = await fireStoreCreateUser.getClient(clientId);
      return clientInfo;
    } on FirebaseException catch (e) {
      print('FirebaseException while fetching client: ${e.message}');
      return Future.error(e.message!);
    } catch (e) {
      print('Unknown error while fetching client: $e');
      return null;
    }
  }
}
