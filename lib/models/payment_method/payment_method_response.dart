import 'package:wallet_app/models/payment_method/payment_method_request.dart';

class PaymentMethodResponse {
  final int paymentMethodId;
  final String? alias;
  final PaymentType type;
  final String issuer;
  final bool isDefault;
  final bool isActive;

  PaymentMethodResponse({
    required this.paymentMethodId,
    this.alias,
    required this.type,
    required this.issuer,
    required this.isDefault,
    required this.isActive,
  });

  factory PaymentMethodResponse.fromJson(Map<String, dynamic> json) =>
      PaymentMethodResponse(
        paymentMethodId: json['id'],
        alias: json['alias'],
        type: PaymentType.values.byName(json['type']),
        issuer: json['issuer'],
        isDefault: json['isDefault'],
        isActive: json['isActive'],
      );
}
