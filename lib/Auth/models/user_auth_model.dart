// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserAuth extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String id;
  final int phoneNumber;
  final String? skills;

  const UserAuth({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.id,
    required this.phoneNumber,
    this.skills,
  });

  factory UserAuth.fromJson(Map<String, dynamic> json) {
    return UserAuth(
      firstName: json["firstName"],
      lastName: json["lastName"],
      email: json["email"],
      id: json["id"],
      phoneNumber: json["phoneNumber"],
      skills: json['skills'] != null ? json['skills'] as String : "No skill",
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'id': id,
      'phoneNumber': phoneNumber,
      'skills': skills,
    };
  }

  @override
  List<Object> get props {
    return [
      firstName,
      lastName,
      email,
      id,
      phoneNumber,
      skills!,
    ];
  }
}
