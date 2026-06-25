enum PaymentType {
  CASH(typeName: 'Cash'),
  CREDIT_CARD(typeName: 'Credit Card'),
  DEBIT_CARD(typeName: 'Debit Card'),
  BANK_TRANSFER(typeName: 'Bank Transfer'),
  WALLET(typeName: 'Wallet'),
  BIZUM(typeName: 'Bizum');

  final String typeName;

  const PaymentType({required this.typeName});
}
