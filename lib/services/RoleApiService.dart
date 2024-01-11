import 'package:plg_test/models/Role.dart'; // Asegúrate de importar el modelo Role
import 'http.dart';
import 'dart:convert' as convert;

class RoleApiService {
  final ApiService apiService = ApiService();

  Future<List<Role>> getAllRoles() async {
    final response = await apiService.get('/api/role/all'); // Asegúrate de tener el endpoint correcto
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse.map((json) => Role.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load roles');
    }
  }

  Future<void> saveRole(Role role) async {
    final response = await apiService.post('/api/role/save', role.toJson()); // Asegúrate de tener el endpoint correcto
    if (response.statusCode != 201) {
      throw Exception('Failed to save role');
    }
  }

  Future<void> updateRole(int roleId, Role updatedRole) async {
    final response = await apiService.put('/api/role/$roleId', updatedRole.toJson()); // Asegúrate de tener el endpoint correcto
    if (response.statusCode != 200) {
      throw Exception('Failed to update role');
    }
  }

  Future<void> deleteRole(int roleId) async {
    final response = await apiService.delete('/api/role/$roleId'); // Asegúrate de tener el endpoint correcto
    if (response.statusCode != 204) {
      throw Exception('Failed to delete role');
    }
  }
}
