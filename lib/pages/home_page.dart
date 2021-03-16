import 'package:doggies_app/BLoC/bloc_provider.dart';
import 'package:doggies_app/BLoC/login_bloc.dart';
import 'package:doggies_app/pages/dogs_tab.dart';
import 'package:doggies_app/pages/login_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final String _title = 'DOGGIES';
  final loginBloc = LoginBloc();
  List<Widget> _children;

  HomePageState() {
    _children = [
      BlocProvider<LoginBloc>(bloc: loginBloc, child: LoginTab()),
      DogsTab()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child:
        Text('$_title',
          style: TextStyle(
            shadows: [
              Shadow(
                color: Colors.white,
                offset: Offset(0, -5)
              )
            ],
            color: Colors.transparent,
            decoration: TextDecoration.underline,
            decorationColor: Colors.white,
            decorationThickness: 2.5,
          ),
        )
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            primaryColor: Colors.white,
        ),
        child: BottomNavigationBar(
          onTap: onTabSelected,
          backgroundColor: Colors.brown,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.login), label: 'login'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'dogs')
          ],
        ),
      ),
      body: _children[_currentIndex],
    );
  }

  void onTabSelected(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
}
