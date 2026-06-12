class ExpenseResumeResponse {
  final int expenseId;
  final String commerce;
  final String? categoryName;
  final double amount;
  final String currency;
  final String? concept;
  final DateTime? date;

  ExpenseResumeResponse({
    required this.expenseId,
    this.categoryName,
    required this.commerce,
    required this.amount,
    required this.currency,
    this.concept,
    this.date,
  });

  factory ExpenseResumeResponse.fromJson(Map<String, dynamic> json) =>
      ExpenseResumeResponse(
        expenseId: json['expenseId'],
        categoryName: json['categoryName'],
        commerce: json['commerce'],
        amount: json['amount'],
        currency: json['currency'],
        concept: json['concept'],
        date: json['date'] != null ? DateTime.parse(json['date']) : null,
      );
}
