import 'package:plg_test/models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static const String _keyUserId = 'id';
  static const String _keyUsername = 'username';
  static const String _keyRoleId = 'role';
  static const String _keyPassword = 'password'; // Nueva clave para la contraseña
  static const String _keyEmail = 'email'; // Nueva clave para el correo electrónico
  // Agrega más claves según sea necesario para otros datos de sesión

  static Future<void> saveSession(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(_keyUserId, user.id);
    prefs.setString(_keyUsername, user.username);
    prefs.setInt(_keyRoleId, user.role);
    prefs.setString(_keyPassword, user.password); // Guarda la contraseña
    prefs.setString(_keyEmail, user.email); // Guarda el correo electrónico
    // Guarda más datos de sesión según sea necesario
  }

  static Future<Map<String, dynamic>?> getSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? id = prefs.getInt(_keyUserId);
    String? username = prefs.getString(_keyUsername);
    int? role = prefs.getInt(_keyRoleId);
    String? password = prefs.getString(_keyPassword); // Obtiene la contraseña
    String? email = prefs.getString(_keyEmail); // Obtiene el correo electrónico

    if (id != null && username != null && role != null) {
      return {
        'id': id,
        'username': username,
        'role': role,
        'password': password, // Agrega la contraseña a los datos de sesión
        'email': email, // Agrega el correo electrónico a los datos de sesión
        // Agrega más datos de sesión según sea necesario
      };
    } else {
      return null;
    }
  }

  static Future<void> clearSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
