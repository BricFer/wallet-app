class IncomeResumeResponse {
  final int incomeId;
  final String source;
  final String? categoryName;
  final double amount;
  final String currency;
  final DateTime? date;

  IncomeResumeResponse({
    required this.incomeId,
    required this.source,
    this.categoryName,
    required this.amount,
    required this.currency,
    this.date,
  });

  factory IncomeResumeResponse.fromJson(Map<String, dynamic> json) =>
      IncomeResumeResponse(
        incomeId: json['incomeId'],
        source: json['source'],
        categoryName: json['categoryName'],
        amount: json['amount'],
        currency: json['currency'],
        date: json['date'] != null ? DateTime.parse(json['date']) : null,
      );
}
