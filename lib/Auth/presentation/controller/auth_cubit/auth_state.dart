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

  LogInSuccessState(this.user);
}

class CubitAuthSignOut extends FirebaseAuthState {}

class CubitAuthFailed extends FirebaseAuthState {
  final String error;
  CubitAuthFailed(this.error);
}
// create user

class CreateClientLoading extends FirebaseAuthState {}

class CreateClientSuccess extends FirebaseAuthState {}
