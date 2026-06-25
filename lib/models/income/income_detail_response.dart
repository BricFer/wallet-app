import 'package:wallet_app/models/payment_method/payment_type.dart';

class IncomeDetailResponse {
  final int incomeId;
  final String? categoryName;
  final int? categoryId;
  final String source;
  final double amount;
  final String currency;
  final String? paymentMethodAlias;
  final PaymentType? paymentMethodType;
  final int? paymentMethodId;
  final DateTime? date;
  final String? note;

  IncomeDetailResponse({
    required this.incomeId,
    this.categoryName,
    this.categoryId,
    required this.source,
    required this.amount,
    required this.currency,
    this.paymentMethodAlias,
    this.paymentMethodType,
    this.paymentMethodId,
    this.date,
    this.note,
  });

  factory IncomeDetailResponse.fromJson(Map<String, dynamic> json) =>
      IncomeDetailResponse(
        incomeId: json['incomeId'],
        categoryName: json['categoryName'],
        categoryId: json['categoryId'],
        source: json['source'],
        amount: json['amount'],
        currency: json['currency'],
        paymentMethodAlias: json['paymentMethodAlias'],
        paymentMethodType: json['paymentMethodType'] != null
            ? PaymentType.values.byName(json['paymentMethodType'])
            : null,
        paymentMethodId: json['paymentMethodId'],
        date: json['date'] != null ? DateTime.parse(json['date']) : null,
        note: json['note'],
      );
}
