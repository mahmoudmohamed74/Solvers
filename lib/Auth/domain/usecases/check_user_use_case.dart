import 'package:solvers/Auth/domain/repository/base_create_user_repo.dart';
import 'package:solvers/core/usecase/base_usecase.dart';

class CheckUserUseCase implements BaseUseCase<String, String> {
  final BaseCreateUserRepo _baseCreateUserRepo;

  CheckUserUseCase(this._baseCreateUserRepo);
  @override
  Future<String> call({required String params}) {
    return _baseCreateUserRepo.checkUser(params);
  }
}
