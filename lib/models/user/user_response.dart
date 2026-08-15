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

  UserResponse copyWith({
    String? username,
    String? fullname,
    String? phoneNumber,
    DateTime? dateOfBirth,
    String? address,
    String? email,
    String? country,
    String? defaultCurrency,
  }) {
    return UserResponse(
      userId: userId,
      username: username ?? this.username,
      fullname: fullname ?? this.fullname,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      address: address ?? this.address,
      email: email ?? this.email,
      country: country ?? this.country,
      defaultCurrency: defaultCurrency ?? this.defaultCurrency,
    );
  }
}
