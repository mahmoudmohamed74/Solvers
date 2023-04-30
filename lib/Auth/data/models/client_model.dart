import 'package:equatable/equatable.dart';

class ClientModel extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String clientId;
  final String type;
  final String phoneNumber;

  const ClientModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.clientId,
    this.type = 'client',
    required this.phoneNumber,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      clientId: json['clientId'],
      type: json['type'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'clientId': clientId,
      'type': type,
      'phoneNumber': phoneNumber,
    };
  }

  @override
  List<Object> get props {
    return [
      firstName,
      lastName,
      email,
      clientId,
      type,
      phoneNumber,
    ];
  }
}
