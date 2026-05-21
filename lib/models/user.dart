class User {
  final String id;
  final String name;
  final String username;
  final String password;
  final String email;
  final String? phone;
  final String defaultCurrency;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.password,
    required this.email,
    this.phone,
    required this.defaultCurrency,
    required this.createdAt,
    required this.updatedAt,
  });
}
