import 'package:doggies_app/BLoC/bloc_provider.dart';
import 'package:doggies_app/BLoC/events/login_event.dart';
import 'package:doggies_app/BLoC/login_bloc.dart';
import 'package:flutter/material.dart';

class LoginTab extends StatefulWidget {
  LoginTab({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginTabState createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
  final TextEditingController _emailController = TextEditingController()
    ..text = "eve.holt@reqres.in";
  final TextEditingController _pswController = TextEditingController()
    ..text = "cityslicka";
  bool _showLoader = false;
  bool _isDisabled = false;

  @override
  void initState() {
    BlocProvider.of<LoginBloc>(context).loginResultStream.listen(onSuccessLogin, onError: onErrorLogin);
    super.initState();
  }



  @override
  void dispose() {
    BlocProvider.of<LoginBloc>(context).dispose();
    super.dispose();
  }

  void onSuccessLogin(String token) {
    setState(() {
      _showLoader = false;
      _isDisabled = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Login successful ! token : $token"),
      backgroundColor: Colors.green,
    ));
  }

  void onErrorLogin(_) {
    setState(() {
      _showLoader = false;
      _isDisabled = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("An error occurred, login failed!"),
      backgroundColor: Colors.red,
    ));
  }

  void onLoginButtonPressed() {
    var event = LoginEvent(email: _emailController.value.text, password: _pswController.value.text);
    BlocProvider.of<LoginBloc>(context).loginEventSink.add(event);
    setState(() {
      _showLoader = true;
      _isDisabled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Center(
          child: SizedBox(
              width: deviceData.size.width / 1.5,
              child: TextField(
                maxLines: 1,
                maxLength: 50,
                readOnly: true,
                controller: _emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.mail_outline_rounded),
                    labelText: "email"),
              )),
        ),
        Center(
          child: SizedBox(
              width: deviceData.size.width / 1.5,
              child: TextField(
                maxLines: 1,
                maxLength: 50,
                readOnly: true,
                obscureText: true,
                controller: _pswController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.lock_outline_rounded),
                  labelText: "password",
                ),
              )),
        ),
        Center(
          child: SizedBox(
            width: 50,
            height: 50,
            child: _showLoader
                ? CircularProgressIndicator()
                : SizedBox(width: 0, height: 0),
          ),
        ),
        Center(
            child: SizedBox(
          child: ElevatedButton(
              onPressed: _isDisabled ? null : onLoginButtonPressed,
              child: Text(
                "Login",
                style: TextStyle(fontSize: 20),
              )),
          width: 110,
          height: 50,
        ))
      ],
    );
  }
}
