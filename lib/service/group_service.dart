import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:wallet_app/models/group/group_request.dart';
import 'package:wallet_app/models/group/group_response.dart';

class GroupService {
  final String baseUrl =
      'postgres-gmll-production.up.railway.app/api/v1/groups';

  Future<String?> _getToken() async {
    final user = FirebaseAuth.instance.currentUser;
    return await user?.getIdToken();
  }

  Future<GroupResponse> saveGroup(GroupRequest dto, int userId) async {
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
      return GroupResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create the group.');
    }
  }

  Future<GroupResponse> updateGroup(
    GroupRequest dto,
    int groupId,
    int userId,
  ) async {
    final token = await _getToken();

    final response = await http.put(
      Uri.parse('$baseUrl/$groupId'),
      headers: {
        'Authorization': 'Bearer $token',
        'userId': userId.toString(),
        'Content-type': 'application/json',
      },
      body: jsonEncode(dto.toJson()),
    );

    if (response.statusCode == 200) {
      return GroupResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update group.');
    }
  }

  Future<GroupResponse> getGroupInfo(int groupId, int userId) async {
    final token = await _getToken();

    final response = await http.get(
      Uri.parse('$baseUrl/$groupId'),
      headers: {
        'Authorization': 'Bearer $token',
        'userId': userId.toString(),
        'Content-type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return GroupResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get group.');
    }
  }

  Future<List<GroupResponse>> getAllGroups(int userId) async {
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
      return data.map((json) => GroupResponse.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get the categories list.');
    }
  }

  Future<List<GroupResponse>> getAllActiveGroups(int userId) async {
    final token = await _getToken();

    final response = await http.get(
      Uri.parse('$baseUrl/active-groups'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'userId': userId.toString(),
        'Content-type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => GroupResponse.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get the categories list.');
    }
  }

  Future<void> deleteGroup(int userId, int groupId) async {
    final token = await _getToken();

    final response = await http.delete(
      Uri.parse('$baseUrl/$groupId'),
      headers: {'Authorization': 'Bearer $token', 'userId': userId.toString()},
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete group.');
    }
  }
}
