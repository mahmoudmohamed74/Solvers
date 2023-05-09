import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solvers/Auth/data/datasource/firebase_auth.dart';
import 'package:solvers/Auth/data/datasource/firestore_create_user.dart';
import 'package:solvers/Auth/data/repository/auth_repo_impl.dart';
import 'package:solvers/Auth/data/repository/create_client_repo_impl.dart';
import 'package:solvers/Auth/data/repository/create_tech_repo_impl.dart';
import 'package:solvers/Auth/domain/repository/base_auth_repo.dart';
import 'package:solvers/Auth/domain/repository/base_create_user_repo.dart';
import 'package:solvers/Auth/domain/usecases/create_client_use_case.dart';
import 'package:solvers/Auth/domain/usecases/create_tech_use_case.dart';
import 'package:solvers/Auth/domain/usecases/get_client_use_case.dart';
import 'package:solvers/Auth/domain/usecases/get_tech_use_case.dart';
import 'package:solvers/Auth/domain/usecases/login_use_case.dart';
import 'package:solvers/Auth/domain/usecases/reset_password_use_case.dart';
import 'package:solvers/Auth/domain/usecases/signout_use_case.dart';
import 'package:solvers/Auth/domain/usecases/signup_use_case.dart';
import 'package:solvers/Auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:solvers/client/data/datasource/create_order.dart';
import 'package:solvers/client/data/repository/create_order_repo_impl.dart';
import 'package:solvers/client/domain/repository/base_create_order_repo.dart';
import 'package:solvers/client/domain/usecases/create_order_use_case.dart';
import 'package:solvers/client/domain/usecases/get_all_offers_use_case.dart';
import 'package:solvers/client/domain/usecases/get_order_use_case.dart';
import 'package:solvers/client/domain/usecases/update_order_offer_use_case.dart';
import 'package:solvers/client/presentation/controller/client_cubit.dart';
import 'package:solvers/core/app/app_prefs.dart';
import 'package:solvers/solver/data/datasource/get_order.dart';
import 'package:solvers/solver/data/repository/base_tech_repo_impl.dart';
import 'package:solvers/solver/domain/repository/base_tech_repo.dart';
import 'package:solvers/solver/domain/usecases/create_offer_use_case.dart';
import 'package:solvers/solver/domain/usecases/get_order_to_tech_use_case.dart';
import 'package:solvers/solver/domain/usecases/update_order_accepted_type_use_case.dart';
import 'package:solvers/solver/presentation/controller/tech_cubit.dart';

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
    // order

    // order's client
    sl.registerLazySingleton<FireStoreCreateOrder>(
      () => FireStoreCreateOrder(),
    );

    // order's tech
    sl.registerLazySingleton<FireStoreGetOrderToTech>(
      () => FireStoreGetOrderToTech(),
    );

    // Repository

    // auth repo
    sl.registerLazySingleton<BaseFirebaseAuthRepository>(
      () => FirebaseAuthRepositoryImpl(sl()),
    );

    sl.registerLazySingleton<BaseCreateClientRepo>(
      () => CreateClientRepoImpl(sl()),
    );

    sl.registerLazySingleton<BaseCreateTechRepo>(
      () => CreateTechRepoImpl(sl()),
    );

    // order's client
    sl.registerLazySingleton<BaseCreateOrderRepo>(
      () => CreateOrderRepoImpl(sl()),
    );

    // order's offer's tech
    sl.registerLazySingleton<BaseTechRepo>(
      () => TechRepoImpl(sl()),
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
    sl.registerLazySingleton<ResetPasswordUseCase>(() => ResetPasswordUseCase(
          sl(),
        ));

    // client use cases

    sl.registerLazySingleton<CreateClientUseCase>(() => CreateClientUseCase(
          sl(),
        ));

    sl.registerLazySingleton<GetClientUseCase>(() => GetClientUseCase(
          sl(),
        ));

    // tech use cases

    sl.registerLazySingleton<CreateTechUseCase>(() => CreateTechUseCase(
          sl(),
        ));

    sl.registerLazySingleton<GetTechUseCase>(() => GetTechUseCase(
          sl(),
        ));

    // order's  client usecases
    sl.registerLazySingleton<CreateOrderUseCase>(() => CreateOrderUseCase(
          sl(),
        ));
    sl.registerLazySingleton<GetOrderToClientUseCase>(
        () => GetOrderToClientUseCase(
              sl(),
            ));

    // offer's client usecases
    sl.registerLazySingleton<GetAllOffersToClientUseCase>(
        () => GetAllOffersToClientUseCase(
              sl(),
            ));
    sl.registerLazySingleton<UpdateOrderOfferUseCase>(
        () => UpdateOrderOfferUseCase(
              sl(),
            ));

    // order's tech usecases

    sl.registerLazySingleton<UpdateOrderAcceptedTypeUseCase>(
        () => UpdateOrderAcceptedTypeUseCase(
              sl(),
            ));
    sl.registerLazySingleton<GetOrderToTechUseCase>(
      () => GetOrderToTechUseCase(
        sl(),
      ),
    );

    // offers's tech usecases

    sl.registerLazySingleton<CreateOfferUseCase>(
      () => CreateOfferUseCase(
        sl(),
      ),
    );

    // auth Blocs

    sl.registerFactory<FirebaseAuthCubit>(
      () => FirebaseAuthCubit(
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
      ),
    );

    sl.registerFactory<ClientCubit>(
      () => ClientCubit(
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
      ),
    );
    sl.registerFactory<TechCubit>(
      () => TechCubit(
        sl(),
        sl(),
        sl(),
      ),
    );
  }
}
