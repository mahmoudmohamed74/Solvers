class UpdateTechDataRequest {
  final String techId;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final List<String> skills;

  UpdateTechDataRequest({
    required this.techId,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.skills,
  });
}
