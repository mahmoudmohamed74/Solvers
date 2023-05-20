import 'package:equatable/equatable.dart';

class TechModel extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String techId;
  final String type;
  final String experience;
  final String phoneNumber;
  final List<String> skills;

  const TechModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.techId,
    this.type = 'technician',
    required this.experience,
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
      type,
      experience,
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
      type: json['type'],
      experience: json['experience'],
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
      'type': type,
      'experience': experience,
      'phoneNumber': phoneNumber,
      'skills': skills,
    };
  }
}
