class RecurringExpense {
  final String id;
  final String userId;
  final String categoryId;
  final String name;
  final double amount;
  final String currency;
  final String frequency;
  final DateTime nextChargeDate;
  final DateTime? lastChargedDate;
  final DateTime? endDate;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  RecurringExpense({
    required this.id,
    required this.userId,
    required this.categoryId,
    required this.name,
    required this.amount,
    required this.currency,
    required this.frequency,
    required this.nextChargeDate,
    this.lastChargedDate,
    this.endDate,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });
}
