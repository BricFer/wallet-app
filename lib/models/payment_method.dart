enum PaymentType { debitCard, creditCard, cash, wallet, bankTransfer, bizum }

class PaymentMethod {
  final String id;
  final String userId;
  final String name;
  final PaymentType type;
  final String? issuer;
  final bool isDefault;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  PaymentMethod({
    required this.id,
    required this.userId,
    required this.name,
    required this.type,
    required this.issuer,
    required this.isDefault,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });
}
