import 'package:doggies_app/BLoC/bloc_provider.dart';
import 'package:doggies_app/BLoC/dog_bloc.dart';
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
  final LoginBloc _loginBloc = LoginBloc();
  final DogBloc _dogBloc = DogBloc();
  List<Widget> _children;

  HomePageState() {
    _children = [
      BlocProvider<LoginBloc>(bloc: _loginBloc, child: LoginTab()),
      BlocProvider<DogBloc>(bloc: _dogBloc, child: DogsTab())
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/paw_logo.png", color: Colors.white),
        title: Center(child:
        Text('$_title', style: Theme.of(context).textTheme.headline2),
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
          selectedFontSize: 20,
          unselectedFontSize: 15,
          unselectedLabelStyle: TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
          selectedLabelStyle: TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.bold),
          iconSize: 35,
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
