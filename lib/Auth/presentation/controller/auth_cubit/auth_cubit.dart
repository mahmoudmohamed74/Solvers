// ignore_for_file: depend_on_referenced_packages

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvers/Auth/data/models/client_model.dart';
import 'package:solvers/Auth/data/models/tech_model.dart';

import 'package:solvers/Auth/domain/entities/registered_user.dart';
import 'package:solvers/Auth/domain/usecases/create_client_use_case.dart';
import 'package:solvers/Auth/domain/usecases/create_tech_use_case.dart';
import 'package:solvers/Auth/domain/usecases/get_client_use_case.dart';
import 'package:solvers/Auth/domain/usecases/get_tech_use_case.dart';
import 'package:solvers/Auth/domain/usecases/login_use_case.dart';
import 'package:solvers/Auth/domain/usecases/signout_use_case.dart';
import 'package:solvers/Auth/domain/usecases/signup_use_case.dart';
import 'package:solvers/core/app/app_prefs.dart';
import 'package:solvers/core/services/services_locator.dart';

part 'auth_state.dart';

class FirebaseAuthCubit extends Cubit<FirebaseAuthState> {
  SignUpAuthUseCase signUpAuthUseCase;
  LogInAuthUseCase logInAuthUseCase;
  SignOutAuthUseCase signOutAuthUseCase;
  CreateClientUseCase createClientUseCase;
  GetClientUseCase getClientUseCase;
  CreateTechUseCase createTechUseCase;
  GetTechUseCase getTechUseCase;
  final AppPreferences _appPreferences = sl<AppPreferences>();
  User? user;
  ClientModel? clientData;
  TechModel? techData;
  String? userRole;

  FirebaseAuthCubit(
    this.signUpAuthUseCase,
    this.logInAuthUseCase,
    this.signOutAuthUseCase,
    this.createClientUseCase,
    this.getClientUseCase,
    this.createTechUseCase,
    this.getTechUseCase,
  ) : super(AuthInitial());

  static FirebaseAuthCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<User?> signUp(RegisteredUser newUserInfo) async {
    emit(CubitAuthLoadingState());
    await signUpAuthUseCase(params: newUserInfo).then((newUser) async {
      user = newUser;
      await user!.sendEmailVerification();
      emit(SignUpSuccessState(user!));
    }).catchError((e) {
      print("${e.toString()} cubit error sign up");
      emit(CubitAuthFailed(e.toString()));
    });

    return user;
  }

  Future<void> logIn(RegisteredUser userInfo) async {
    emit(CubitAuthLoadingState());
    await logInAuthUseCase(params: userInfo).then((user) async {
      this.user = user;
      print(user.uid);
      await getClientCubit(clientId: user.uid);
      await getTechCubit(techId: user.uid);
      if (clientData != null) {
        userRole = 'client';
      } else if (techData != null) {
        userRole = 'technician';
      }
      emit(LogInSuccessState(user, userRole));
    }).catchError((e) {
      print("${e.toString()} login user error cubit");
      emit(CubitAuthFailed(e.toString()));
    });
  }

  Future<void> signOut({required String userId}) async {
    emit(CubitAuthLoadingState());
    await signOutAuthUseCase.call(params: userId).then((value) async {
      // _appPreferences.logoutClient();
      emit(CubitAuthSignOut());
    }).catchError((e) {
      emit(CubitAuthFailed(e.toString()));
    });
  }

  Future<void> createClient(ClientModel clientModel) async {
    emit(CreateClientLoading());
    try {
      await createClientUseCase(params: clientModel);
      emit(CreateClientSuccess());
    } catch (e) {
      print("${e.toString()} create client error cubit ");
      emit(CreateClientFailed(e.toString()));
    }
  }

  Future<ClientModel?> getClientCubit({required String clientId}) async {
    emit(GetClientLoading());
    emit(CubitAuthLoadingState()); // for con builder
    return await getClientUseCase.call(params: clientId).then((value) async {
      clientData = value;
      if (clientData != null) {
        emit(GetClientSuccess(clientData));
      } else {
        emit(GetClientFailed("client data is null"));
      }
    }).catchError((e) {
      print("cubit error failed to retrieve client data ${e.toString()}");
      emit(GetClientError(e.toString()));
    });
  }

  Future<void> createTech(TechModel techModel) async {
    emit(CreateTechLoading());
    emit(CubitAuthLoadingState()); // for con builder
    try {
      await createTechUseCase(params: techModel);
      emit(CreateTechSuccess());
    } catch (e) {
      print("${e.toString()} create tech error cubit ");
      emit(CreateTechFailed(e.toString()));
    }
  }

  Future<TechModel?> getTechCubit({required String techId}) async {
    emit(GetTechLoading());
    return await getTechUseCase.call(params: techId).then((value) async {
      techData = value;
      if (techData != null) {
        emit(GetTechSuccess(techData));
      } else {
        emit(GetTechFailed("technician data is null"));
      }
    }).catchError((e) {
      print("cubit error failed to retrieve tech data ${e.toString()}");
      emit(GetTechError(e.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off;
    emit(ChangePasswordVisibilityState());
  }
}
