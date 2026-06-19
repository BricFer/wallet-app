import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:wallet_app/models/expense/expense_detail_response.dart';
import 'package:wallet_app/models/expense/expense_request.dart';
import 'package:wallet_app/models/expense/expense_resume_response.dart';

class ExpenseService {
  final String baseUrl =
      'https://wallet-app-production-db4e.up.railway.app/api/v1/expenses';

  Future<String?> _getToken() async {
    final user = FirebaseAuth.instance.currentUser;
    return await user?.getIdToken();
  }

  Future<ExpenseDetailResponse> getExpenseInfo(
    int? userId,
    int? expenseId,
  ) async {
    final token = await _getToken();

    final response = await http.get(
      Uri.parse('$baseUrl/$expenseId'),
      headers: {
        'Authorization': 'Bearer $token',
        'userId': userId.toString(),
        'Content-type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return ExpenseDetailResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error trying to get the expense.');
    }
  }

  Future<ExpenseDetailResponse> saveExpense(
    ExpenseRequest dto,
    int userId,
  ) async {
    final token = await _getToken();

    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'userId': userId.toString(),
        'Content-type': 'application/json',
      },
      body: jsonEncode(dto.toJson()),
    );

    if (response.statusCode == 201) {
      return ExpenseDetailResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create expense.');
    }
  }

  Future<ExpenseDetailResponse> updateExpense(
    ExpenseRequest dto,
    int userId,
    int expenseId,
  ) async {
    final token = await _getToken();

    final response = await http.put(
      Uri.parse('$baseUrl/$expenseId'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'userId': userId.toString(),
        'Content-type': 'application/json',
      },
      body: jsonEncode(dto.toJson()),
    );

    if (response.statusCode == 200) {
      return ExpenseDetailResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create expense.');
    }
  }

  Future<List<ExpenseResumeResponse>> getAllExpenses(int? userId) async {
    final token = await _getToken();

    final response = await http.get(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'userId': userId.toString(),
        'Content-type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => ExpenseResumeResponse.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get the expense list.');
    }
  }

  Future<List<ExpenseResumeResponse>> getAllExpensesByCurrency(
    int userId,
    String currency,
  ) async {
    final token = await _getToken();

    final response = await http.get(
      Uri.parse('$baseUrl/by-currency?currency=$currency'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'userId': userId.toString(),
        'Content-type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => ExpenseResumeResponse.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get the expense list for $currency.');
    }
  }

  Future<List<ExpenseResumeResponse>> getAllExpensesByCategory(
    int userId,
    int categoryId,
  ) async {
    final token = await _getToken();

    final response = await http.get(
      Uri.parse('$baseUrl/by-category?categoryId=$categoryId'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'userId': userId.toString(),
        'Content-type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => ExpenseResumeResponse.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get the expense list for that category.');
    }
  }

  Future<double> getExpensesTotal(int userId, String currency) async {
    final token = await _getToken();

    final response = await http.get(
      Uri.parse('$baseUrl/total?currency=$currency'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'userId': userId.toString(),
        'Content-type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get the total.');
    }
  }

  Future<double> getExpensesMonthlyTotal(
    int userId,
    String currency,
    int month,
  ) async {
    final token = await _getToken();

    final response = await http.get(
      Uri.parse('$baseUrl/monthly-total?currency=$currency&month=$month'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'userId': userId.toString(),
        'Content-type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get the total by month.');
    }
  }

  Future<double> getExpensesMonthlyTotalByPaymentMethod(
    int userId,
    String currency,
    int month,
    int paymentMethodId,
  ) async {
    final token = await _getToken();

    final response = await http.get(
      Uri.parse(
        '$baseUrl/payment-method/$paymentMethodId/total?currency=$currency&month=$month',
      ),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'userId': userId.toString(),
        'Content-type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get the total by month and payment method.');
    }
  }

  Future<List<ExpenseResumeResponse>> getExpensesByPaymentMethod(
    int userId,
    String currency,
    int paymentMethodId,
  ) async {
    final token = await _getToken();

    final response = await http.get(
      Uri.parse('$baseUrl/payment-method/$paymentMethodId?currency=$currency'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'userId': userId.toString(),
        'Content-type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => ExpenseResumeResponse.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get the total by payment method.');
    }
  }

  Future<List<ExpenseResumeResponse>> getAllExpensesByGroup(
    int userId,
    int groupId,
  ) async {
    final token = await _getToken();

    final response = await http.get(
      Uri.parse('$baseUrl/by-group?groupId=$groupId'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'userId': userId.toString(),
        'Content-type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => ExpenseResumeResponse.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get the expense list for that group.');
    }
  }

  Future<List<ExpenseResumeResponse>> getAllExpensesByDatePeriod(
    int userId,
    String startDate,
    String endDate,
  ) async {
    final token = await _getToken();

    final response = await http.get(
      Uri.parse('$baseUrl/by-date?start=$startDate&end=$endDate'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'userId': userId.toString(),
        'Content-type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => ExpenseResumeResponse.fromJson(json)).toList();
    } else {
      throw Exception(
        'Failed to get the expense list for that period of time.',
      );
    }
  }

  Future<List<ExpenseResumeResponse>> getExpensesTotalByCategory(
    int userId,
    int categoryId,
    String currency,
  ) async {
    final token = await _getToken();

    final response = await http.get(
      Uri.parse(
        '$baseUrl/category-total?categoryId=$categoryId&currency=$currency',
      ),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'userId': userId.toString(),
        'Content-type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get the expense list for that category.');
    }
  }

  Future<void> deleteExpense(int userId, int expenseId) async {
    final token = await _getToken();

    final response = await http.delete(
      Uri.parse('$baseUrl/$expenseId'),
      headers: {'Authorization': 'Bearer $token', 'userId': userId.toString()},
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete expense.');
    }
  }
}
