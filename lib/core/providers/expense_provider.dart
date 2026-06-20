import 'package:flutter/material.dart';
import 'package:wallet_app/models/expense/expense_resume_response.dart';
import 'package:wallet_app/service/expense_service.dart';

class ExpenseProvider extends ChangeNotifier {
  final ExpenseService _service = ExpenseService();

  List<ExpenseResumeResponse> expenses = [];

  double total = 0.0;
  bool isLoading = false;

  Future<void> loadExpenses(int userId, String currency) async {
    isLoading = true;
    notifyListeners();

    try {
      final results = await Future.wait([
        _service.getAllExpenses(userId),
        _service.getExpensesTotal(userId, currency),
      ]);

      expenses = results[0] as List<ExpenseResumeResponse>;
      total = results[1] as double;
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
