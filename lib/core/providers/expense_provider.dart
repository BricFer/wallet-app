import 'package:flutter/material.dart';
import 'package:wallet_app/models/expense/expense_detail_response.dart';
import 'package:wallet_app/models/expense/expense_request.dart';
import 'package:wallet_app/models/expense/expense_resume_response.dart';
import 'package:wallet_app/service/expense_service.dart';

class ExpenseProvider extends ChangeNotifier {
  final ExpenseService _service = ExpenseService();

  List<ExpenseResumeResponse> expenses = [];

  ExpenseDetailResponse? selectedExpense;
  bool isLoadingDetail = false;

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

  Future<void> loadExpensesByCurrency(int userId, String currency) async {
    isLoading = true;
    notifyListeners();

    try {
      expenses = await _service.getAllExpensesByCurrency(userId, currency);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadExpenseDetail(int userId, int? expenseId) async {
    if (expenseId == null) {
      selectedExpense = null;
      return;
    }

    isLoadingDetail = true;
    notifyListeners();

    try {
      selectedExpense = await _service.getExpenseInfo(userId, expenseId);
    } catch (e) {
      debugPrint(e.toString());
      selectedExpense = null;
    } finally {
      isLoadingDetail = false;
      notifyListeners();
    }
  }

  Future<void> loadTotal(int userId, String currency) async {
    isLoading = true;
    notifyListeners();

    try {
      total = await _service.getExpensesTotal(userId, currency);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> saveExpense(
    int userId,
    ExpenseRequest dto,
    int? expenseId,
  ) async {
    isLoading = true;
    notifyListeners();

    try {
      if (expenseId == null) {
        await _service.saveExpense(dto, userId);
      } else {
        await _service.updateExpense(dto, userId, expenseId);
      }

      await loadExpenses(userId, 'EUR');
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteExpense(int userId, int expenseId) async {
    isLoading = true;
    notifyListeners();

    try {
      await _service.deleteExpense(userId, expenseId);
      // Luego de eliminarlo del backend, lo elimino de mi lista "expenses" y consume menos peticiones HTTP
      expenses.removeWhere((expense) => expense.expenseId == expenseId);
    } catch (e) {
      debugPrint(e.toString());
      debugPrint('Failed to delete de expense.');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
