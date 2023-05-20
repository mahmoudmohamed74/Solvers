part of 'auth_cubit.dart';

abstract class FirebaseAuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitial extends FirebaseAuthState {}

class CubitAuthLoadingState extends FirebaseAuthState {}

class SignUpSuccessState extends FirebaseAuthState {
  final User user;

  SignUpSuccessState(this.user);
}

class LogInSuccessState extends FirebaseAuthState {
  final User user;
  final String? userRole;

  LogInSuccessState(
    this.user,
    this.userRole,
  );
}

class CubitAuthSignOut extends FirebaseAuthState {}

class ResetPasswordSuccessState extends FirebaseAuthState {}

class ResetPasswordErrorState extends FirebaseAuthState {
  final String errorMessage;

  ResetPasswordErrorState(this.errorMessage);
}

class CubitAuthFailed extends FirebaseAuthState {
  final String error;
  CubitAuthFailed(this.error);
}
// create client

class CreateClientLoading extends FirebaseAuthState {}

class CreateClientSuccess extends FirebaseAuthState {}

class CreateClientFailed extends FirebaseAuthState {
  final String error;

  CreateClientFailed(this.error);
}

// create tech

class CreateTechLoading extends FirebaseAuthState {}

class CreateTechSuccess extends FirebaseAuthState {}

class CreateTechFailed extends FirebaseAuthState {
  final String error;

  CreateTechFailed(this.error);
}

class ChangePasswordVisibilityLoadingState extends FirebaseAuthState {}

class ChangePasswordVisibilityState extends FirebaseAuthState {}
