import 'package:flutter/material.dart';

class LoginTab extends StatefulWidget {
  LoginTab({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginTabState createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
  final TextEditingController _emailController = TextEditingController()
    ..text = "default_value";
  final TextEditingController _pswController = TextEditingController()
    ..text = "default_value";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Center(
          child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: TextField(
                maxLines: 1,
                maxLength: 50,
                readOnly: true,
                controller: _emailController,
                decoration: InputDecoration(
                  icon: Icon(Icons.mail_outline_rounded),
                  labelText: "email"
                ),
              )),
        ),
        Center(
          child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: TextField(
                maxLines: 1,
                maxLength: 50,
                readOnly: true,
                controller: _pswController,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock_outline_rounded),
                  labelText: "password",
                ),
              )),
        ),
        Center(child: ElevatedButton(onPressed: () {}, child: Text("Login")))
      ],
    );
  }
}
