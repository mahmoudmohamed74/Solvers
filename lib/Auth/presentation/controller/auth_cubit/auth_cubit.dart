// ignore_for_file: depend_on_referenced_packages

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:solvers/Auth/domain/entities/registered_user.dart';
import 'package:solvers/Auth/domain/usecases/login_use_case.dart';
import 'package:solvers/Auth/domain/usecases/signout_use_case.dart';
import 'package:solvers/Auth/domain/usecases/signup_use_case.dart';

part 'auth_state.dart';

class FirebaseAuthCubit extends Cubit<FirebaseAuthState> {
  SignUpAuthUseCase signUpAuthUseCase;
  LogInAuthUseCase logInAuthUseCase;
  SignOutAuthUseCase signOutAuthUseCase;
  User? user;
  FirebaseAuthCubit(
    this.signUpAuthUseCase,
    this.logInAuthUseCase,
    this.signOutAuthUseCase,
  ) : super(AuthInitial());

  static FirebaseAuthCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<User?> signUp(RegisteredUser newUserInfo) async {
    emit(CubitAuthConfirming());
    await signUpAuthUseCase(params: newUserInfo).then((newUser) {
      emit(CubitAuthConfirmed(newUser));
      user = newUser;
    }).catchError((e) {
      print("${e.toString()} sssssssss");
      emit(CubitAuthFailed(e.toString()));
    });
    return user;
  }

  Future<void> logIn(RegisteredUser userInfo) async {
    emit(CubitAuthConfirming());
    await logInAuthUseCase(params: userInfo).then((user) {
      emit(CubitAuthConfirmed(user));
      this.user = user;
      print(user.displayName);
      print(user.uid);
    }).catchError((e) {
      print("${e.toString()} sssssssss");
      emit(CubitAuthFailed(e.toString()));
    });
  }

  Future<void> signOut({required String userId}) async {
    emit(CubitAuthConfirming());
    await signOutAuthUseCase.call(params: userId).then((value) async {
      emit(CubitAuthSignOut());
    }).catchError((e) {
      emit(CubitAuthFailed(e.toString()));
    });
  }
}
