import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:wallet_app/models/payment_method/payment_method_request.dart';
import 'package:wallet_app/models/payment_method/payment_method_response.dart';

class PaymentMethodService {
  final String baseUrl =
      'https://wallet-app-production-db4e.up.railway.app/api/v1/payment-methods';

  Future<String?> _getToken() async {
    final user = FirebaseAuth.instance.currentUser;
    return await user?.getIdToken();
  }

  Future<PaymentMethodResponse> getPaymentMethodInfo(
    int methodId,
    int userId,
  ) async {
    final token = await _getToken();

    final response = await http.get(
      Uri.parse('$baseUrl/$methodId'),
      headers: {
        'Authorization': 'Bearer $token',
        'userId': userId.toString(),
        'Content-type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return PaymentMethodResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get group.');
    }
  }

  Future<List<PaymentMethodResponse>> getAllPaymentMethods(int userId) async {
    final token = await _getToken();

    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'Authorization': 'Bearer $token',
        'userId': userId.toString(),
        'Content-type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => PaymentMethodResponse.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get the payment methods list');
    }
  }

  Future<List<PaymentMethodResponse>> getAllActivePaymentMethods(
    int userId,
  ) async {
    final token = await _getToken();

    final response = await http.get(
      Uri.parse('$baseUrl/active-methods'),
      headers: {
        'Authorization': 'Bearer $token',
        'userId': userId.toString(),
        'Content-type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => PaymentMethodResponse.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get the active payment methods list');
    }
  }

  Future<List<PaymentMethodResponse>> getAllPaymentMethodsByType(
    int userId,
    String type,
  ) async {
    final token = await _getToken();

    final response = await http.get(
      Uri.parse('$baseUrl/by-type?type=$type'),
      headers: {
        'Authorization': 'Bearer $token',
        'userId': userId.toString(),
        'Content-type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => PaymentMethodResponse.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get the active payment methods list');
    }
  }

  Future<PaymentMethodResponse> savePaymentMethod(
    PaymentMethodRequest dto,
    int userId,
  ) async {
    final token = await _getToken();

    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Authorization': 'Bearer $token',
        'userId': userId.toString(),
        'Content-type': 'application/json',
      },
      body: jsonEncode(dto.toJson()),
    );

    if (response.statusCode == 201) {
      return PaymentMethodResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create payment method.');
    }
  }

  Future<PaymentMethodResponse> updatePaymentMethod(
    PaymentMethodRequest dto,
    int methodId,
    int userId,
  ) async {
    final token = await _getToken();

    final response = await http.put(
      Uri.parse('$baseUrl/$methodId'),
      headers: {
        'Authorization': 'Bearer $token',
        'userId': userId.toString(),
        'Content-type': 'application/json',
      },
      body: jsonEncode(dto.toJson()),
    );

    if (response.statusCode == 200) {
      return PaymentMethodResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update payment method.');
    }
  }

  Future<void> deletePaymentMethod(int userId, int methodId) async {
    final token = await _getToken();

    final response = await http.delete(
      Uri.parse('$baseUrl/$methodId'),
      headers: {'Authorization': 'Bearer $token', 'userId': userId.toString()},
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete payment method.');
    }
  }
}
