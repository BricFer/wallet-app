class UserRequest {
  final String? username;
  final String fullname;
  final String phoneNumber;
  final DateTime dateOfBirth;
  final String address;
  final String email;
  final String country;
  final String defaultCurrency;

  UserRequest({
    this.username,
    required this.fullname,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.address,
    required this.email,
    required this.country,
    required this.defaultCurrency,
  });

  Map<String, dynamic> toJson() => {
    'username': username,
    'fullname': fullname,
    'phoneNumber': phoneNumber,
    'dateOfBirth': dateOfBirth.toIso8601String(),
    'address': address,
    'email': email,
    'country': country,
    'defaultCurrency': defaultCurrency,
  };
}
