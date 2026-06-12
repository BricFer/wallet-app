/// DTO send to backend
class ExpenseRequest {
  final int? categoryId;
  final int? groupId;
  final String commerce;
  final String? concept;
  final int? paymentMethodId;
  final double amount;
  final String currency;
  final String? note;
  // final String? imagePath;
  final DateTime date;

  ExpenseRequest({
    this.categoryId,
    this.groupId,
    this.paymentMethodId,
    required this.commerce,
    required this.amount,
    required this.currency,
    this.concept,
    this.note,
    // this.imagePath,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
    'categoryId': categoryId,
    'groupId': groupId,
    'paymentMethodId': paymentMethodId,
    'commerce': commerce,
    'amount': amount,
    'currency': currency,
    'concept': concept,
    'note': note,
    // 'imagePath': imagePath,
    'date': date.toIso8601String(),
  };
}