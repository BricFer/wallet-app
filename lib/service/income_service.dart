import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:wallet_app/models/income/income_detail_response.dart';
import 'package:wallet_app/models/income/income_request.dart';
import 'package:wallet_app/models/income/income_resume_response.dart';

class IncomeService {
  final String baseUrl =
      'https://wallet-app-production-db4e.up.railway.app/api/v1/incomes';

  Future<String?> _getToken() async {
    final user = FirebaseAuth.instance.currentUser;
    return await user?.getIdToken();
  }

  Future<IncomeDetailResponse> getIncomeInfo(int userId, int incomeId) async {
    final token = await _getToken();

    final response = await http.get(
      Uri.parse('$baseUrl/$incomeId'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return IncomeDetailResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error trying to get the income.');
    }
  }

  Future<IncomeDetailResponse> saveIncome(IncomeRequest dto, int userId) async {
    final token = await _getToken();

    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-type': 'application/json',
      },
      body: jsonEncode(dto.toJson()),
    );

    if (response.statusCode == 201) {
      return IncomeDetailResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create income.');
    }
  }

  Future<IncomeDetailResponse> updateIncome(
    IncomeRequest dto,
    int userId,
    int incomeId,
  ) async {
    final token = await _getToken();

    final response = await http.put(
      Uri.parse('$baseUrl/$incomeId'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-type': 'application/json',
      },
      body: jsonEncode(dto.toJson()),
    );

    if (response.statusCode == 200) {
      return IncomeDetailResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create income.');
    }
  }

  Future<List<IncomeResumeResponse>> getAllIncomes(int userId) async {
    final token = await _getToken();

    final response = await http.get(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => IncomeResumeResponse.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get the income list.');
    }
  }

  Future<List<IncomeResumeResponse>> getAllIncomesByCurrency(
    int userId,
    String currency,
  ) async {
    final token = await _getToken();

    final response = await http.get(
      Uri.parse('$baseUrl/by-currency?currency=$currency'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => IncomeResumeResponse.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get the income list for $currency.');
    }
  }

  Future<List<IncomeResumeResponse>> getAllIncomesByCategory(
    int userId,
    int categoryId,
  ) async {
    final token = await _getToken();

    final response = await http.get(
      Uri.parse('$baseUrl/by-category?categoryId=$categoryId'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => IncomeResumeResponse.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get the income list for that category.');
    }
  }

  Future<double> getIncomesTotal(int userId, String currency) async {
    final token = await _getToken();

    final response = await http.get(
      Uri.parse('$baseUrl/total?currency=$currency'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get the total.');
    }
  }

  Future<double> getIncomesMonthlyTotal(
    int userId,
    String currency,
    int month,
  ) async {
    final token = await _getToken();

    final response = await http.get(
      Uri.parse('$baseUrl/monthly-total?currency=$currency&month=$month'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get the total by month.');
    }
  }

  Future<List<IncomeResumeResponse>> getIncomesByPaymentMethod(
    int userId,
    String currency,
    int paymentMethodId,
  ) async {
    final token = await _getToken();

    final response = await http.get(
      Uri.parse('$baseUrl/payment-method/$paymentMethodId?currency=$currency'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => IncomeResumeResponse.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get the total by payment method.');
    }
  }

  Future<List<IncomeResumeResponse>> getAllIncomesByDatePeriod(
    int userId,
    String startDate,
    String endDate,
  ) async {
    final token = await _getToken();

    final response = await http.get(
      Uri.parse('$baseUrl/by-date?start=$startDate&end=$endDate'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => IncomeResumeResponse.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get the income list for that period of time.');
    }
  }

  Future<void> deleteIncome(int userId, int incomeId) async {
    final token = await _getToken();

    final response = await http.delete(
      Uri.parse('$baseUrl/$incomeId'),
      headers: {'Authorization': 'Bearer $token', 'userId': userId.toString()},
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete income.');
    }
  }
}
