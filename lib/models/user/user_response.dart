class UserResponse {
  final int userId;
  final String? username;
  final String fullname;
  final String phoneNumber;
  final DateTime dateOfBirth;
  final String address;
  final String email;
  final String country;
  final String defaultCurrency;

  UserResponse({
    required this.userId,
    this.username,
    required this.fullname,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.address,
    required this.email,
    required this.country,
    required this.defaultCurrency,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
    userId: json['userId'],
    username: json['username'],
    fullname: json['fullname'],
    phoneNumber: json['phoneNumber'],
    dateOfBirth: DateTime.parse(json['dateOfBirth']),
    address: json['address'],
    email: json['email'],
    country: json['country'],
    defaultCurrency: json['defaultCurrency'],
  );
}
