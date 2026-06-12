import 'package:wallet_app/models/payment_method.dart';

class ExpenseDetailResponse {
  final int expenseId;
  final String? categoryName;
  final int? categoryId;
  final String? groupName;
  final int? groupId;
  final String commerce;
  final String? concept;
  final String? paymentMethodAlias;
  final PaymentType? paymentMethodType;
  final int paymentMethodId;
  final double amount;
  final String currency;
  final DateTime? date;
  final String? note;
  // final String? imagePath;

  ExpenseDetailResponse({
    required this.expenseId,
    required this.commerce,
    this.concept,
    this.note,
    required this.amount,
    required this.currency,
    this.date,
    this.categoryName,
    this.categoryId,
    this.groupName,
    this.groupId,
    this.paymentMethodAlias,
    this.paymentMethodType,
    required this.paymentMethodId,
    // this.imagePath,
  });

  factory ExpenseDetailResponse.fromJson(Map<String, dynamic> json) =>
      ExpenseDetailResponse(
        expenseId: json['expenseId'],
        commerce: json['commerce'],
        concept: json['concept'],
        note: json['note'],
        amount: json['amount'],
        currency: json['currency'],
        date: json['date'] != null ? DateTime.parse(json['date']) : null,
        categoryName: json['caegoryName'],
        categoryId: json['categoryId'],
        groupName: json['groupName'],
        groupId: json['groupId'],
        paymentMethodAlias: json['paymentMethodAlias'],
        paymentMethodType: json['paymentMethodType'] != null
            ? PaymentType.values.byName(json['paymentMethodType'])
            : null,
        paymentMethodId: json['paymentMethodId'],
        // imagePath: json['imagePath'],
      );
}
