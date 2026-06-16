class UpdateBirthRequest {
  final DateTime dateOfBirth;

  UpdateBirthRequest({required this.dateOfBirth});

  Map<String, dynamic> toJson() => {
    'dateOfBirth': dateOfBirth.toIso8601String(),
  };
}
