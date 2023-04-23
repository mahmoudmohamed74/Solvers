import 'package:firebase_auth/firebase_auth.dart';
import 'package:solvers/Auth/data/models/client_model.dart';
import 'package:solvers/Auth/domain/repository/base_create_user_repo.dart';
import 'package:solvers/core/usecase/base_usecase.dart';

class CreateClientUseCase implements BaseUseCase<void, ClientModel> {
  final BaseCreateUserRepo _baseCreateUserRepo;

  CreateClientUseCase(this._baseCreateUserRepo);

  @override
  Future<void> call({required ClientModel params}) {
    return _baseCreateUserRepo.createClient(params);
  }

  // Future<void> execute(User client) async {
  //   await _baseCreateUserRepo.createClient(client);
  // }
}
