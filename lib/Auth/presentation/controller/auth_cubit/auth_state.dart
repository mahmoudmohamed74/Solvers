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

// get client

class GetClientLoading extends FirebaseAuthState {}

class GetClientSuccess extends FirebaseAuthState {
  final ClientModel? clientModel;

  GetClientSuccess(this.clientModel);
}

class GetClientError extends FirebaseAuthState {
  final String error;

  GetClientError(this.error);
}

class GetClientFailed extends FirebaseAuthState {
  final String error;

  GetClientFailed(this.error);
}

// create tech

class CreateTechLoading extends FirebaseAuthState {}

class CreateTechSuccess extends FirebaseAuthState {}

class CreateTechFailed extends FirebaseAuthState {
  final String error;

  CreateTechFailed(this.error);
}

// get tech

class GetTechLoading extends FirebaseAuthState {}

class GetTechSuccess extends FirebaseAuthState {
  final TechModel? techModel;

  GetTechSuccess(this.techModel);
}

class GetTechFailed extends FirebaseAuthState {
  final String error;

  GetTechFailed(this.error);
}

class GetTechError extends FirebaseAuthState {
  final String error;

  GetTechError(this.error);
}

class ChangePasswordVisibilityState extends FirebaseAuthState {}
