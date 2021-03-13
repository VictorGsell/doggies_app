import 'package:flutter/material.dart';
import 'package:doggies_app/pages/login_tabdart';

void main() {
  runApp(DoggiesApp());
}

class DoggiesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doggies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/login': (BuildContext context) => LoginPage(title: 'Login'),
      },
      home: LoginPage(title: 'Login'),
    );
  }
}