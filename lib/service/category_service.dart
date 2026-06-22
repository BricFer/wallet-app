import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallet_app/models/category/category_response.dart';

class CategoryService {
  final String baseUrl =
      'https://wallet-app-production-db4e.up.railway.app/api/v1/categories';

  Future<List<CategoryResponse>> getAllCategories() async {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: <String, String>{'Content-type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => CategoryResponse.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get the categories list.');
    }
  }

  Future<List<CategoryResponse>> getAllCategoriesByType(String type) async {
    final response = await http.get(
      Uri.parse('$baseUrl/by-type?type=$type'),
      headers: <String, String>{'Content-type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => CategoryResponse.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get the categories list.');
    }
  }
}
