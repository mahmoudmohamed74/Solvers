class UpdateClientDataRequest {
  final String clientId;
  final String firstName;
  final String lastName;
  final String phoneNumber;

  UpdateClientDataRequest({
    required this.clientId,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
  });
}
