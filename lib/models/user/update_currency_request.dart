class UpdateCurrencyRequest {
  final String defaultCurrency;

  UpdateCurrencyRequest({required this.defaultCurrency});

  Map<String, dynamic> toJson() => {'defaultCurrency': defaultCurrency};
}
