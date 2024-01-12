import 'package:flutter/material.dart';
import 'package:plg_test/views/loginView.dart';
import 'package:plg_test/views/superUserView.dart';

class MyApp extends StatelessWidget {
  final Map<String, dynamic>? sessionData;

  const MyApp({super.key, this.sessionData});

  @override
  Widget build(BuildContext context) {
    // Verificar si hay datos de sesión
    if (sessionData != null) {
      print("from MyApp");
      print(sessionData.runtimeType);
      dynamic user = sessionData;
      // // Si hay datos de sesión, construir el usuario desde los datos
      // final user = User.fromJson(sessionData!);

      // Realizar la navegación basada en el roleId del usuario
      if (user['role'] == 3) {
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
