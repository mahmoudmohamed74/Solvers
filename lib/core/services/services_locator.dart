import 'package:get_it/get_it.dart';
import 'package:solvers/Auth/data/repository/auth_repo_impl.dart';
import 'package:solvers/Auth/domain/repository/base_auth_repo.dart';
import 'package:solvers/Auth/domain/usecases/login_use_case.dart';
import 'package:solvers/Auth/domain/usecases/signout_use_case.dart';
import 'package:solvers/Auth/domain/usecases/signup_use_case.dart';
import 'package:solvers/Auth/presentation/controller/auth_cubit/auth_cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  Future<void> init() async {
    // 1 Data Sources (route)

    // 2 Repository

    sl.registerLazySingleton<BaseFirebaseAuthRepository>(
      () => FirebaseAuthRepositoryImpl(),
    );

    // Firebase auth useCases
    sl.registerLazySingleton<LogInAuthUseCase>(() => LogInAuthUseCase(
          sl(),
        ));

    sl.registerLazySingleton<SignUpAuthUseCase>(() => SignUpAuthUseCase(
          sl(),
        ));

    sl.registerLazySingleton<SignOutAuthUseCase>(() => SignOutAuthUseCase(
          sl(),
        ));

    // auth Blocs
    sl.registerFactory<FirebaseAuthCubit>(
      () => FirebaseAuthCubit(
        sl(),
        sl(),
        sl(),
      ),
    );
  }
}
