part of 'auth_cubit.dart';

abstract class FirebaseAuthState extends Equatable {
  const FirebaseAuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends FirebaseAuthState {}

class CubitAuthConfirming extends FirebaseAuthState {}

class CubitAuthConfirmed extends FirebaseAuthState {
  final User user;

  const CubitAuthConfirmed(this.user);
}

class CubitAuthSignOut extends FirebaseAuthState {}

class CubitAuthFailed extends FirebaseAuthState {
  final String error;
  const CubitAuthFailed(this.error);
}
