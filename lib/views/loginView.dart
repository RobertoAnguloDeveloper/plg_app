import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:plg_test/services/SessionManager.dart';
import 'package:plg_test/services/UserApiService.dart';
import 'package:plg_test/views/superUserView.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Welcome to PLG CMMS',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(46.0),
          child: LoginForm(), // Aquí utilizamos un nuevo widget LoginForm
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: _usernameController,
            decoration: InputDecoration(labelText: 'Username'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            obscureText: true,
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          SizedBox(height: 46.0),
          ElevatedButton(
            onPressed: () async{
              if (_formKey.currentState!.validate()) {
                // Realizar la lógica de inicio de sesión aquí
                // Aquí utilizamos el servicio para verificar el usuario
                final userApiService = UserApiService();
                final users = await userApiService.getAllUsers();

                final enteredUsername = _usernameController.text;
                final enteredPassword = _passwordController.text;

                // Buscar el usuario
                final user = users.firstWhereOrNull((user) =>
                    user.username == enteredUsername && user.password == enteredPassword);

                if (user != null) {

                  // Guardar la sesión con el userId, username y roleId
                  // Guardar la sesión con el usuario completo
                  await SessionManager.saveSession(user);


                  // Verificar el ID del rol
                  if (user.role == 3) {
                    // Conducir a otra pantalla si el ID del rol es 3 (Super user)
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SuperUserPage(user: user!)),
                      );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Login Successful')),
                    );
                  } else {
                    // Mostrar mensaje si el ID del rol no es 3
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Login Successful')),
                    );
                  }
                } else {
                  // Mostrar mensaje si el usuario no existe
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Invalid username or password')),
                  );
                }
              }
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}