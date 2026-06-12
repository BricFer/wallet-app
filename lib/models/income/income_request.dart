class IncomeRequest {
  final int? categoryId;
  final String source;
  final double amount;
  final String currency;
  final int paymentMethodId;
  final DateTime? date;
  final String? note;

  IncomeRequest({
    this.categoryId,
    required this.source,
    required this.amount,
    required this.currency,
    required this.paymentMethodId,
    this.date,
    this.note
  });

  Map<String, dynamic> toJson () => {
    'categoryId': categoryId,
    'source': source,
    'amount': amount,
    'currency': currency,
    'paymentMethodId': paymentMethodId,
    'date': date?.toIso8601String(),
    'note': note,
  };
}