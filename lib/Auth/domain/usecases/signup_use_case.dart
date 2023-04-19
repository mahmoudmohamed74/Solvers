import 'package:firebase_auth/firebase_auth.dart';
import 'package:solvers/Auth/domain/entities/registered_user.dart';
import 'package:solvers/Auth/domain/repository/base_auth_repo.dart';
import 'package:solvers/core/usecase/base_usecase.dart';

class SignUpAuthUseCase implements BaseUseCase<User, RegisteredUser> {
  final BaseFirebaseAuthRepository _baseFirebaseAuthRepository;

  SignUpAuthUseCase(this._baseFirebaseAuthRepository);

  @override
  Future<User> call({required RegisteredUser params}) {
    return _baseFirebaseAuthRepository.signUp(params);
  }
}
