import 'package:plg_test/models/UserSport.dart'; // Asegúrate de importar el modelo UserSport

import 'dart:convert' as convert;
import 'http.dart';

class UserSportApiService {
  final ApiService apiService = ApiService();

  Future<List<UserSport>> getAllUserSports() async {
    final response = await apiService.get('/api/user-sport/all'); // Asegúrate de tener el endpoint correcto
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse.map((json) => UserSport.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load user sports');
    }
  }

  Future<void> saveUserSport(UserSport userSport) async {
    final response = await apiService.post('/api/user-sport/save', userSport.toJson()); // Asegúrate de tener el endpoint correcto
    if (response.statusCode != 201) {
      throw Exception('Failed to save user sport');
    }
  }

  Future<void> updateUserSport(int userSportId, UserSport updatedUserSport) async {
    final response = await apiService.put('/api/user-sport/update', updatedUserSport.toJson()); // Asegúrate de tener el endpoint correcto
    if (response.statusCode != 200) {
      throw Exception('Failed to update user sport');
    }
  }

  Future<void> deleteUserSport(int userSportId) async {
    final response = await apiService.delete('/api/user-sport/$userSportId'); // Asegúrate de tener el endpoint correcto
    if (response.statusCode != 204) {
      throw Exception('Failed to delete user sport');
    }
  }
}
