import 'package:plg_test/models/Sport.dart'; // Asegúrate de importar el modelo Sport

import 'dart:convert' as convert;
import 'http.dart';

class SportApiService {
  final ApiService apiService = ApiService();

  Future<List<Sport>> getAllSports() async {
    final response = await apiService.get('/api/sport/all'); // Asegúrate de tener el endpoint correcto
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse.map((json) => Sport.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load sports');
    }
  }

  Future<void> saveSport(Sport sport) async {
    final response = await apiService.post('/api/sport/save', sport.toJson()); // Asegúrate de tener el endpoint correcto
    if (response.statusCode != 201) {
      throw Exception('Failed to save sport');
    }
  }

  Future<void> updateSport(int sportId, Sport updatedSport) async {
    final response = await apiService.put('/api/sport/update', updatedSport.toJson()); // Asegúrate de tener el endpoint correcto
    if (response.statusCode != 200) {
      throw Exception('Failed to update sport');
    }
  }

  Future<void> deleteSport(int sportId) async {
    final response = await apiService.delete('/api/sport/$sportId'); // Asegúrate de tener el endpoint correcto
    if (response.statusCode != 204) {
      throw Exception('Failed to delete sport');
    }
  }
}
