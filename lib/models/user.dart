class User {
  final String id;
  final String name;
  final String firebaseUid;
  final String username;
  final String? phone;
  final String defaultCurrency;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.firebaseUid,
    required this.username,
    this.phone,
    required this.defaultCurrency,
    required this.createdAt,
    required this.updatedAt,
  });
}
