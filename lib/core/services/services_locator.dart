import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solvers/Auth/data/datasource/firebase_auth.dart';
import 'package:solvers/Auth/data/datasource/firestore_create_user.dart';
import 'package:solvers/Auth/data/repository/auth_repo_impl.dart';
import 'package:solvers/Auth/data/repository/create_user_repo_impl.dart';
import 'package:solvers/Auth/domain/repository/base_auth_repo.dart';
import 'package:solvers/Auth/domain/repository/base_create_user_repo.dart';
import 'package:solvers/Auth/domain/usecases/create_client_use_case.dart';
import 'package:solvers/Auth/domain/usecases/login_use_case.dart';
import 'package:solvers/Auth/domain/usecases/signout_use_case.dart';
import 'package:solvers/Auth/domain/usecases/signup_use_case.dart';
import 'package:solvers/Auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:solvers/core/app/app_prefs.dart';

final sl = GetIt.instance;

class ServicesLocator {
  Future<void> init() async {
    final sharedPrefs = await SharedPreferences.getInstance();

    // shared prefs instance
    sl.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

    // app prefs instance
    sl.registerLazySingleton<AppPreferences>(() => AppPreferences(sl()));

    // 1 Data Sources (route)
    sl.registerLazySingleton<FirebaseAuthentication>(
      () => FirebaseAuthentication(),
    );
    sl.registerLazySingleton<FireStoreCreateUser>(
      () => FireStoreCreateUser(),
    );

    // 2 Repository

    sl.registerLazySingleton<BaseFirebaseAuthRepository>(
      () => FirebaseAuthRepositoryImpl(sl()),
    );

    sl.registerLazySingleton<BaseCreateUserRepo>(
      () => CreateUserRepoImpl(sl()),
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

    // client use cases

    sl.registerLazySingleton<CreateClientUseCase>(() => CreateClientUseCase(
          sl(),
        ));

    // auth Blocs
    sl.registerFactory<FirebaseAuthCubit>(
      () => FirebaseAuthCubit(
        sl(),
        sl(),
        sl(),
        sl(),
      ),
    );
  }
}
