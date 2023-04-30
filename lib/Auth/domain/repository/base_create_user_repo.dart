import 'package:solvers/Auth/data/models/client_model.dart';
import 'package:solvers/Auth/data/models/tech_model.dart';

abstract class BaseCreateClientRepo {
  Future<void> createClient(ClientModel client);
  Future<ClientModel?> getClient(String clientId);
}

abstract class BaseCreateTechRepo {
  Future<void> createTech(TechModel tech);
  Future<TechModel?> getTech(String techId);
}
