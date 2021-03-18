import 'dart:ui';
import 'package:doggies_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:doggies_app/pages/landing_page.dart';

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
        textTheme: TextTheme(
          headline1: TextStyle(fontFamily: 'Pacifico', fontSize: 50, color: Colors.white),
          headline2: TextStyle(fontFamily: 'Pacifico', fontSize: 20, color: Colors.white),
          caption: TextStyle(fontFamily: 'Orkney', fontSize: 10, fontStyle: FontStyle.italic),
          subtitle1: TextStyle(fontFamily: 'Orkney', fontSize: 20, color: Colors.black),
          subtitle2: TextStyle(fontFamily: 'Lobster', fontSize: 20, color: Colors.white),
          button: TextStyle(fontFamily: 'Orkney', fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          bodyText1: TextStyle(fontFamily: 'Orkney', fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
          bodyText2: TextStyle(fontFamily: 'Orkney', fontSize: 15, color: Colors.black),
        )
      ),
      routes: {
        "/home": (BuildContext context) => HomePage(),
      },
      home: LandingPage(),
    );
  }
}