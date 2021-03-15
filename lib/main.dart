import 'package:flutter/material.dart';
import 'package:doggies_app/pages/home_page.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(DoggiesApp());
  });
}

class DoggiesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DoggiesApp',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        buttonColor: Colors.brown,
      ),
      home: HomePage(),
    );
  }
}