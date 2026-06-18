import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallet_app/models/user/user_request.dart';
import 'package:wallet_app/models/user/user_response.dart';

class UserService {
  final String baseUrl = 'postgres-gmll-production.up.railway.app/api/v1/user';

  Future<String?> _getToken() async {
    final user = FirebaseAuth.instance.currentUser;
    return await user?.getIdToken();
  }

  Future<UserResponse> saveUser(UserRequest dto) async {
    final token = await _getToken();

    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-type': 'application/json',
      },
      body: jsonEncode(dto.toJson()),
    );

    if (response.statusCode == 201) {
      return UserResponse.fromJson(jsonDecode(response.body));
    } else {
      debugPrint('STATUS CODE: ${response.statusCode}');
      debugPrint('BODY: ${response.body}');

      throw Exception(
        'Failed to create profile. '
        'Status: ${response.statusCode}. '
        'Body: ${response.body}',
      );
    }
  }

  Future<UserResponse?> getUserInfo() async {
    final token = await _getToken();

    final response = await http.get(
      Uri.parse('$baseUrl/user-info'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return UserResponse.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      return null;
    } else {
      throw Exception('Error trying to get the user.');
    }
  }

  Future<void> updateUsername(int userId, String username) async {
    return _patchField(userId, '$baseUrl/user-info/username', {
      'username': username,
    });
  }

  Future<void> updateFullname(int userId, String fullname) async {
    return _patchField(userId, '$baseUrl/user-info/fullname', {
      'fullname': fullname,
    });
  }

  Future<void> updatePhoneNumber(int userId, String phoneNumber) async {
    return _patchField(userId, '$baseUrl/user-info/phone', {
      'phoneNumber': phoneNumber,
    });
  }

  Future<void> updateDateOfBirth(int userId, String dateOfBirth) async {
    return _patchField(userId, '$baseUrl/user-info/birth', {
      'dateOfBirth': dateOfBirth,
    });
  }

  Future<void> updateAddress(int userId, String address) async {
    return _patchField(userId, '$baseUrl/user-info/address', {
      'address': address,
    });
  }

  Future<void> updateCountry(int userId, String country) async {
    return _patchField(userId, '$baseUrl/user-info/country', {
      'country': country,
    });
  }

  Future<void> updateEmail(int userId, String email) async {
    User? _user = FirebaseAuth.instance.currentUser;
    await _user?.verifyBeforeUpdateEmail(email);

    return await _patchField(userId, '$baseUrl/user-info/email', {
      'email': email,
    });
  }

  Future<void> updateDefaultCurrency(int userId, String currency) async {
    return _patchField(userId, '$baseUrl/user-info/currency', {
      'defaultCurrency': currency,
    });
  }

  Future<void> deleteUser(int userId) async {
    final token = await _getToken();

    final response = await http.delete(
      Uri.parse(baseUrl),
      headers: {'Authorization': 'Bearer $token', 'userId': userId.toString()},
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete user.');
    }
  }

  Future<void> _patchField(
    int userId,
    String path,
    Map<String, dynamic> body,
  ) async {
    final token = await _getToken();
    final response = await http.patch(
      Uri.parse(path),
      headers: {
        'Authorization': 'Bearer $token',
        'userId': userId.toString(),
        'Content-type': 'application/json',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update the field-');
    }
  }
}
