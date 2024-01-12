import 'package:flutter/material.dart';
import 'package:plg_test/services/SessionManager.dart';
import 'package:plg_test/models/User.dart';
import 'package:plg_test/views/loginView.dart';
import 'package:plg_test/views/superUserView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Cargar los datos de la sesión
  final sessionData = await SessionManager.getSession();

  print(sessionData);

  // Ejecutar la aplicación con los datos de la sesión
  runApp(MyApp(sessionData: sessionData));
}

class MyApp extends StatelessWidget {
  final Map<String, dynamic>? sessionData;

  const MyApp({Key? key, this.sessionData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Verificar si hay datos de sesión
    if (sessionData != null) {
      // Si hay datos de sesión, construir el usuario desde los datos
      final user = User.fromJson(sessionData!);

      print("Session data");
      print(user.role?.toString());

      // Realizar la navegación basada en el roleId del usuario
      if (user.role == 3) {
        // Si el roleId es 3, navega a la pantalla de SuperUser
        return MaterialApp(
          home: SuperUserPage(user: user),
          // Configura más propiedades según sea necesario
          theme: ThemeData(
            // Configura el tema de tu aplicación
            primarySwatch: Colors.blue,
          ),
        );
      }
    }

    // De lo contrario, muestra la pantalla de login
    return MaterialApp(
      home: LoginPage(),
      // Configura más propiedades según sea necesario
      theme: ThemeData(
        // Configura el tema de tu aplicación
        primarySwatch: Colors.blue,
      ),
    );
  }
}
