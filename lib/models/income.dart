class Income {
  final String id;
  final String userId;
  final String categoryId;
  final double amount;
  final String currency;
  final String? paymentMethodId;
  final DateTime date;
  final String? note;
  final DateTime createdAt;
  final DateTime updatedAt;

  Income({
    required this.id,
    required this.userId,
    required this.categoryId,
    required this.amount,
    required this.currency,
    this.paymentMethodId,
    required this.date,
    this.note,
    required this.createdAt,
    required this.updatedAt,
  });
}