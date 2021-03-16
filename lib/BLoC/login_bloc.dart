import 'dart:async';
import 'package:doggies_app/BLoC/bloc.dart';
import 'package:doggies_app/services/login_service.dart';

class LoginBloc implements Bloc {
  final LoginService _service = loginService;
  final _loginController = StreamController<String>();

  Stream<String> get loginStream => _loginController.stream;

  void doLogin({String email, String password}) async {
    try {
      var loginResponse =
          await _service.login(email: email, password: password);
      _loginController.sink.add(loginResponse.token);
    } catch (error) {
      _loginController.sink.addError(error);
    }
  }

  @override
  void dispose() {
    _loginController.close();
  }
}
