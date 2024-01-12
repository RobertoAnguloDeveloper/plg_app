import 'package:flutter/material.dart';
import 'package:plg_test/services/SessionManager.dart';
import 'package:plg_test/views/MyApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Cargar los datos de la sesión
  final sessionData = await SessionManager.getSession();

  print(sessionData);

  // Ejecutar la aplicación con los datos de la sesión
  runApp(MyApp(sessionData: sessionData));
}