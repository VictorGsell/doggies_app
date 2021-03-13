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
  String _title = 'DoggiesApp';
  final List<Widget> _children = [
    LoginTab(),
    DogsTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('$_title')),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabSelected,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.login), label: 'login'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'dogs')
        ],
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
