import 'package:firebase_auth/firebase_auth.dart';
import 'package:solvers/Auth/domain/entities/registered_user.dart';
import 'package:solvers/Auth/domain/repository/base_auth_repo.dart';
import 'package:solvers/core/usecase/base_usecase.dart';

class LogInAuthUseCase implements BaseUseCase<User, RegisteredUser> {
  final BaseFirebaseAuthRepository _baseFirebaseAuthRepository;

  LogInAuthUseCase(this._baseFirebaseAuthRepository);

  @override
  Future<User> call({required RegisteredUser params}) {
    return _baseFirebaseAuthRepository.logIn(params);
  }
}
