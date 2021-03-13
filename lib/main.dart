import 'package:flutter/material.dart';
import 'package:doggies_app/pages/login_page.dart';

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
      home: LoginPage(title: 'Login'),
    );
  }
}