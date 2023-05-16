import 'package:solvers/Auth/data/models/client_model.dart';
import 'package:solvers/Auth/data/models/tech_model.dart';

abstract class BaseCreateUserRepo {
  Future<void> createTech(TechModel tech);
  Future<void> createClient(ClientModel client);
  Future<String> checkUser(String userId);
}
