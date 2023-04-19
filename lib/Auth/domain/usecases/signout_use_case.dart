import 'package:solvers/Auth/domain/repository/base_auth_repo.dart';
import 'package:solvers/core/usecase/base_usecase.dart';

class SignOutAuthUseCase implements BaseUseCase<void, String> {
  final BaseFirebaseAuthRepository _baseFirebaseAuthRepository;

  SignOutAuthUseCase(this._baseFirebaseAuthRepository);

  @override
  Future<void> call({required String params}) {
    return _baseFirebaseAuthRepository.signOut(userId: params);
  }
}
