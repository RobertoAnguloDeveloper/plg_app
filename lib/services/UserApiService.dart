import 'package:plg_test/models/User.dart';

import 'dart:convert' as convert;
import 'http.dart';

class UserApiService {
  final ApiService apiService = ApiService();

  Future<List<User>> getAllUsers() async {
    final response = await apiService.get('/api/user/all');
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<void> saveUser(User user) async {
    final response = await apiService.post('/api/user/save', user.toJson());
    if (response.statusCode != 201) {
      throw Exception('Failed to save user');
    }
  }

  Future<void> updateUser(int userId, User updatedUser) async {
    final response = await apiService.put('/api/user/$userId', updatedUser.toJson());
    if (response.statusCode != 200) {
      throw Exception('Failed to update user');
    }
  }

  Future<void> deleteUser(int userId) async {
    final response = await apiService.delete('/api/user/$userId');
    if (response.statusCode != 204) {
      throw Exception('Failed to delete user');
    }
  }
}
