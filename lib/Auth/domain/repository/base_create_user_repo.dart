import 'package:firebase_auth/firebase_auth.dart';
import 'package:solvers/Auth/data/models/client_model.dart';

abstract class BaseCreateUserRepo {
  Future<void> createClient(ClientModel client);
  // Future<ClientModel?> getClient(String clientId);
}
