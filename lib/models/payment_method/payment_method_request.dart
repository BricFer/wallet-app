enum PaymentType { CASH, CREDIT_CARD, DEBIT_CARD, BANK_TRANSFER, WALLET, BIZUM }

class PaymentMethodRequest {
  final String? alias;
  final PaymentType type;
  final String issuer;
  final bool isDefault;
  final bool isActive;

  PaymentMethodRequest({
    this.alias,
    required this.type,
    required this.issuer,
    required this.isDefault,
    required this.isActive,
  });

  Map<String, dynamic> toJson() => {
    'alias': alias,
    'type': type.name,
    'issuer': issuer,
    'isDefault': isDefault,
    'isActive': isActive,
  };
}
