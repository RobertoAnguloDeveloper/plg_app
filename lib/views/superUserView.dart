import 'package:flutter/material.dart';
import 'package:plg_test/models/User.dart';

class SuperUserPage extends StatelessWidget {
  final User user;

  SuperUserPage({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'SUPER ADMINISTRATOR',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        drawer: buildDrawer(context),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(46.0),
            child:
                WelcomeMessage(user: user), // Mostrar el mensaje de bienvenida
          ),
        ),
      ),
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Opción 1',
              style: TextStyle(color: Colors.white), // Establecer color del texto
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              'Opción 2',
              style: TextStyle(color: Colors.white), // Establecer color del texto
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}


class WelcomeMessage extends StatelessWidget {
  final User user;

  WelcomeMessage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Welcome, ${user.username}!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Text(
          'You are logged in as a Super User.',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
