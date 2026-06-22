import 'package:wallet_app/models/currency.dart';

class DefaultCurrency {
  static const List<Currency> currencies = [
    Currency(name: 'Dolar', code: 'USD', symbol: '\$'),
    Currency(name: 'Euro', code: 'EUR', symbol: '€'),
    Currency(name: 'Yen', code: 'JPY', symbol: '¥'),
    Currency(name: 'Yuan', code: 'CNY', symbol: '¥'),
    Currency(name: 'Pound', code: 'GBP', symbol: '£'),
    Currency(name: 'Zloty', code: 'PLN', symbol: 'zł'),
  ];
}
