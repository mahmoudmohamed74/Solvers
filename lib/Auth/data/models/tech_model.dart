import 'dart:convert';

import 'package:equatable/equatable.dart';

class TechModel extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String techId;
  final int phoneNumber;
  final List<String> skills;

  const TechModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.techId,
    required this.phoneNumber,
    required this.skills,
  });

  @override
  List<Object> get props {
    return [
      firstName,
      lastName,
      email,
      techId,
      phoneNumber,
      skills,
    ];
  }

  factory TechModel.fromJson(Map<String, dynamic> json) {
    return TechModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      techId: json['techId'],
      phoneNumber: json['phoneNumber'],
      skills: List<String>.from(
        (json['skills']),
      ),
    );
  }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'techId': techId,
      'phoneNumber': phoneNumber,
      'skills': skills,
    };
  }
}
