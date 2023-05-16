import 'package:solvers/Auth/domain/repository/base_auth_repo.dart';
import 'package:solvers/core/usecase/base_usecase.dart';

class SignOutAuthUseCase implements BaseWithNoParmUseCase<void, NoParameters> {
  final BaseFirebaseAuthRepository _baseFirebaseAuthRepository;

  SignOutAuthUseCase(this._baseFirebaseAuthRepository);

  @override
  Future<void> call(NoParameters parameters) {
    return _baseFirebaseAuthRepository.signOut();
  }
}
