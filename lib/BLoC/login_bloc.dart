import 'dart:async';
import 'package:doggies_app/BLoC/bloc.dart';
import 'package:doggies_app/BLoC/events/login_event.dart';
import 'package:doggies_app/services/login_service.dart';

class LoginBloc implements Bloc {
  final LoginService _service = LoginService();
  StreamController<String> _loginResultController = StreamController<String>.broadcast();
  StreamController<LoginEvent> _loginEventController = StreamController<LoginEvent>();

  LoginBloc() {
    _loginEventController.stream.listen(_doLogin);
  }

  Stream<String> get loginResultStream => _loginResultController.stream;
  Sink<LoginEvent> get loginEventSink => _loginEventController.sink;
  bool get isLoginEventSinkClosed => _loginEventController.isClosed;
  bool get isLoginResultStreamClosed => _loginResultController.isClosed;

  void _doLogin(LoginEvent event) async {
    try {
      var loginResponse =
          await _service.login(email: event.email, password: event.password);
      if (!_loginResultController.isClosed)
        _loginResultController.sink.add(loginResponse.token);
    } catch (error) {
      if (!_loginResultController.isClosed)
        _loginResultController.sink.addError(error);
    }
  }

  @override
  void init() {
    if (isLoginResultStreamClosed)
      _loginResultController = StreamController<String>.broadcast();
    if (isLoginEventSinkClosed) {
      _loginEventController = StreamController<LoginEvent>();
      _loginEventController.stream.listen(_doLogin);
    }
  }

  @override
  void dispose() {
    _loginResultController.close();
    _loginEventController.close();
  }
}
