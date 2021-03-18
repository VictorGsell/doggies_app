import 'package:doggies_app/BLoC/dog_bloc.dart';
import 'package:doggies_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:doggies_app/pages/landing_page.dart';
import 'package:doggies_app/BLoC/bloc_provider.dart';

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
      routes: {
        "/home": (BuildContext context) => HomePage(),
      },
      home: BlocProvider<DogBloc>(child: LandingPage(), bloc: DogBloc()),
    );
  }
}