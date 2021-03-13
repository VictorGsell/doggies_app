import 'package:flutter/material.dart';

class LoginTab extends StatefulWidget {
  LoginTab({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginTabState createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[],
    );
  }
}
