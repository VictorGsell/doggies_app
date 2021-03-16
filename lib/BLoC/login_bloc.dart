import 'dart:async';
import 'package:doggies_app/BLoC/bloc.dart';
import 'package:doggies_app/BLoC/events/login_event.dart';
import 'package:doggies_app/services/login_service.dart';
import 'package:flutter/cupertino.dart';

class LoginBloc implements Bloc {
  final LoginService _service = LoginService();
  final StreamController<String> _loginResultController = StreamController<String>.broadcast();
  final StreamController<LoginEvent> _loginEventController = StreamController<LoginEvent>();

  LoginBloc() {
    _loginEventController.stream.listen(_doLogin);
  }

  Stream<String> get loginResultStream => _loginResultController.stream;
  Sink<LoginEvent> get loginEventSink => _loginEventController.sink;

  void _doLogin(LoginEvent event) async {
    try {
      var loginResponse =
          await _service.login(email: event.email, password: event.password);
      _loginResultController.sink.add(loginResponse.token);
    } catch (error) {
      _loginResultController.sink.addError(error);
    }
  }

  @override
  void dispose() {
    _loginResultController.close();
    _loginEventController.close();
  }
}
