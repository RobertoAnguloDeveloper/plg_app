import 'package:plg_test/models/UserHobby.dart'; // Asegúrate de importar el modelo UserHobby

import 'dart:convert' as convert;
import 'http.dart';

class UserHobbyApiService {
  final ApiService apiService = ApiService();

  Future<List<UserHobby>> getAllUserHobbies() async {
    final response = await apiService.get('/api/user-hobby/all'); // Asegúrate de tener el endpoint correcto
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse.map((json) => UserHobby.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load user hobbies');
    }
  }

  Future<void> saveUserHobby(UserHobby userHobby) async {
    final response = await apiService.post('/api/user-hobby/save', userHobby.toJson()); // Asegúrate de tener el endpoint correcto
    if (response.statusCode != 201) {
      throw Exception('Failed to save user hobby');
    }
  }

  Future<void> updateUserHobby(int userHobbyId, UserHobby updatedUserHobby) async {
    final response = await apiService.put('/api/user-hobby/update', updatedUserHobby.toJson()); // Asegúrate de tener el endpoint correcto
    if (response.statusCode != 200) {
      throw Exception('Failed to update user hobby');
    }
  }

  Future<void> deleteUserHobby(int userHobbyId) async {
    final response = await apiService.delete('/api/user-hobby/$userHobbyId'); // Asegúrate de tener el endpoint correcto
    if (response.statusCode != 204) {
      throw Exception('Failed to delete user hobby');
    }
  }
}
