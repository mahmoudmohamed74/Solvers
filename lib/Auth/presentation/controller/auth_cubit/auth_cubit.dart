// ignore_for_file: depend_on_referenced_packages

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvers/Auth/data/models/client_model.dart';
import 'package:solvers/Auth/data/models/tech_model.dart';

import 'package:solvers/Auth/domain/entities/registered_user.dart';
import 'package:solvers/Auth/domain/usecases/check_user_use_case.dart';
import 'package:solvers/Auth/domain/usecases/create_client_use_case.dart';
import 'package:solvers/Auth/domain/usecases/create_tech_use_case.dart';
import 'package:solvers/Auth/domain/usecases/login_use_case.dart';
import 'package:solvers/Auth/domain/usecases/reset_password_use_case.dart';
import 'package:solvers/Auth/domain/usecases/signup_use_case.dart';
import 'package:solvers/core/app/app_prefs.dart';
import 'package:solvers/core/services/services_locator.dart';
import 'package:solvers/core/utils/constants.dart';

part 'auth_state.dart';

class FirebaseAuthCubit extends Cubit<FirebaseAuthState> {
  final SignUpAuthUseCase _signUpAuthUseCase;
  final LogInAuthUseCase _logInAuthUseCase;
  final CreateClientUseCase _createClientUseCase;
  final CreateTechUseCase _createTechUseCase;
  final ResetPasswordUseCase _restPasswordUseCase;
  final CheckUserUseCase _checkUserUseCase;
  final AppPreferences _appPreferences = sl<AppPreferences>();

  User? user;
  String? userRole;

  FirebaseAuthCubit(
    this._signUpAuthUseCase,
    this._logInAuthUseCase,
    this._createClientUseCase,
    this._createTechUseCase,
    this._restPasswordUseCase,
    this._checkUserUseCase,
  ) : super(AuthInitial());

  static FirebaseAuthCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<User?> signUp(RegisteredUser newUserInfo) async {
    emit(CubitAuthLoadingState());
    await _signUpAuthUseCase(params: newUserInfo).then((newUser) async {
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
    await _logInAuthUseCase(params: userInfo).then((user) async {
      this.user = user;
      print(user.uid);

      userRole = await checkUser(userId: user.uid);
      if (userRole == "client") {
        await _appPreferences.saveClientId(user.uid);
        Constants.clientId = await _appPreferences.getClientId();
        print("Constants.clientId ${Constants.clientId} ....");
      }
      if (userRole == "technician") {
        await _appPreferences.saveTechnicianId(user.uid);
        Constants.techId = await _appPreferences.getTechnicianId();
        print("Constants.techId ${Constants.techId} ....");
      }

      emit(LogInSuccessState(user, userRole));
    }).catchError((e) {
      print("${e.toString()} login user error cubit");
      emit(CubitAuthFailed(e.toString()));
    });
  }

  Future<void> resetPassword(context, String email) async {
    emit(CubitAuthLoadingState());

    await _restPasswordUseCase.call(params: email).then((value) {
      emit(ResetPasswordSuccessState());
    }).catchError((error) {
      emit(ResetPasswordErrorState(error.toString()));
    });
  }

  Future<void> createClient(ClientModel clientModel) async {
    emit(CreateClientLoading());
    try {
      await _createClientUseCase(params: clientModel);
      emit(CreateClientSuccess());
    } catch (e) {
      print("${e.toString()} create client error cubit ");
      emit(CreateClientFailed(e.toString()));
    }
  }

  Future<String> checkUser({required String userId}) async {
    return await _checkUserUseCase.call(params: userId);
  }

  Future<void> createTech(TechModel techModel) async {
    emit(CreateTechLoading());
    try {
      await _createTechUseCase(params: techModel);
      emit(CreateTechSuccess());
    } catch (e) {
      print("${e.toString()} create tech error cubit ");
      emit(CreateTechFailed(e.toString()));
    }
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off;
    emit(ChangePasswordVisibilityState());
  }
}
