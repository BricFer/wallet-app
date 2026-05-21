class Budget {
  final String id;
  final String userId;
  final double amount;
  final String currency;
  final String period;
  final double alertThreshold;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  Budget({
    required this.id,
    required this.userId,
    required this.amount,
    required this.currency,
    required this.period,
    required this.alertThreshold,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });
}
