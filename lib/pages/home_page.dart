import 'package:doggies_app/pages/dogs_tab.dart';
import 'package:doggies_app/pages/login_tab.dart';
import 'package:doggies_app/providers/home_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final String _title = "DOGGIES";
  final List<StatefulWidget> _children = [
    LoginTab(),
    DogsTab()
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(
      builder: (context, homeNotifier, _) {
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
              onTap: (int value) => homeNotifier.currentIndex = value,
              backgroundColor: Colors.brown,
              currentIndex: homeNotifier.currentIndex,
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
          body: _children[homeNotifier.currentIndex],
        );
      },
    );
  }
}
