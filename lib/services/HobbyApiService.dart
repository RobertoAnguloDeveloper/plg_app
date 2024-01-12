import 'package:plg_test/models/Hobby.dart'; // Asegúrate de importar el modelo Hobby

import 'dart:convert' as convert;
import 'http.dart';

class HobbyApiService {
  final ApiService apiService = ApiService();

  Future<List<Hobby>> getAllHobbies() async {
    final response = await apiService.get('/api/hobby/all'); // Asegúrate de tener el endpoint correcto
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse.map((json) => Hobby.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load hobbies');
    }
  }

  Future<void> saveHobby(Hobby hobby) async {
    final response = await apiService.post('/api/hobby/save', hobby.toJson()); // Asegúrate de tener el endpoint correcto
    if (response.statusCode != 201) {
      throw Exception('Failed to save hobby');
    }
  }

  Future<void> updateHobby(int hobbyId, Hobby updatedHobby) async {
    final response = await apiService.put('/api/hobby/update', updatedHobby.toJson()); // Asegúrate de tener el endpoint correcto
    if (response.statusCode != 200) {
      throw Exception('Failed to update hobby');
    }
  }

  Future<void> deleteHobby(int hobbyId) async {
    final response = await apiService.delete('/api/hobby/$hobbyId'); // Asegúrate de tener el endpoint correcto
    if (response.statusCode != 204) {
      throw Exception('Failed to delete hobby');
    }
  }
}
