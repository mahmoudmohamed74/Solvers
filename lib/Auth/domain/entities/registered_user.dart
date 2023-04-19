// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class RegisteredUser extends Equatable {
  String email;
  String password;

  RegisteredUser({this.email = "", this.password = ""});

  @override
  List<Object> get props => [email, password];
}
