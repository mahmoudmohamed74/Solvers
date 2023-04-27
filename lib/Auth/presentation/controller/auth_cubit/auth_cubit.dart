// ignore_for_file: depend_on_referenced_packages

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvers/Auth/data/models/client_model.dart';

import 'package:solvers/Auth/domain/entities/registered_user.dart';
import 'package:solvers/Auth/domain/usecases/create_client_use_case.dart';
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
  final AppPreferences _appPreferences = sl<AppPreferences>();
  User? user;
  FirebaseAuthCubit(
    this.signUpAuthUseCase,
    this.logInAuthUseCase,
    this.signOutAuthUseCase,
    this.createClientUseCase,
  ) : super(AuthInitial());

  static FirebaseAuthCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<User?> signUp(RegisteredUser newUserInfo) async {
    emit(CubitAuthLoadingState());
    await signUpAuthUseCase(params: newUserInfo).then((newUser) {
      user = newUser;
      emit(SignUpSuccessState(user!));
    }).catchError((e) {
      print("${e.toString()} sssssssss");
      emit(CubitAuthFailed(e.toString()));
    });

    return user;
  }

  Future<void> createClient(ClientModel clientModel) async {
    emit(CreateClientLoading());
    try {
      await createClientUseCase(params: clientModel);
      emit(CreateClientSuccess());
    } catch (e) {
      print("${e.toString()} create client error cubit ");
      emit(CubitAuthFailed(e.toString()));
    }
  }

  Future<void> logIn(RegisteredUser userInfo) async {
    emit(CubitAuthLoadingState());
    await logInAuthUseCase(params: userInfo).then((user) {
      this.user = user;
      emit(LogInSuccessState(user));
      print(user.uid);
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
}
