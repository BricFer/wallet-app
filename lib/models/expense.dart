class Expense {
  final String id;
  final String userId;
  final String categoryId;
  final String? groupId;
  final String? paymentMethodId;
  final double amount;
  final String currency;
  final DateTime date;
  final String? note;
  final String? imagePath;
  final DateTime createdAt;
  final DateTime updatedAt;

  Expense({
    required this.id,
    required this.userId,
    required this.categoryId,
    this.groupId,
    this.paymentMethodId,
    required this.amount,
    required this.currency,
    required this.date,
    this.note,
    this.imagePath,
    required this.createdAt,
    required this.updatedAt,
  });
}