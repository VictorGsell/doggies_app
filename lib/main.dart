import 'package:flutter/material.dart';
import 'package:doggies_app/pages/home_page.dart';

void main() {
  runApp(DoggiesApp());
}

class DoggiesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DoggiesApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}