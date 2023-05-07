import 'package:solvers/Auth/domain/repository/base_auth_repo.dart';
import 'package:solvers/core/usecase/base_usecase.dart';

class ResetPasswordUseCase extends BaseUseCase<void, String> {
  final BaseFirebaseAuthRepository _firebaseAuthRepository;

  ResetPasswordUseCase(this._firebaseAuthRepository);

  @override
  Future<void> call({required String params}) async {
    await _firebaseAuthRepository.resetPassword(email: params);
  }
}
