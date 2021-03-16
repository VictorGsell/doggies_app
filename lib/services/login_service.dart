import 'package:doggies_app/services/api/login_api.dart';
import 'package:dio/dio.dart';

// Login service using singleton pattern
class LoginService {
  static final LoginService _instance = LoginService._internal();
  final Dio _dio = Dio();
  LoginApi _api;

  factory LoginService() {
    return _instance;
  }

  LoginService._internal() {
    this._dio.options.headers = {"content-type": "application/json"};
    this._api = LoginApi(_dio);
  }

  Future<LoginResponse> login({String email, String password}) async {
    email ??= "eve.holt@reqres.in";
    password ??= "cityslicka";
    try {
      return await this
          ._api
          .login(Credentials(email: email, password: password));
    } catch (error) {
      printDioErrorDetails(error);
      rethrow;
    }
  }

  // display method for debugging
  void printDioErrorDetails(DioError error) {
    print("error message: " + error.message);
    print("method : " + error.request.method);
    print("baseUrl : " + error.request.baseUrl);
    print("path : " + error.request.path);
    print("endpoint : " + error.request.uri.toString());
    print("content-type : " + error.request.contentType.toString());
    print("data : " + error.request.data.toString());
    print("response-type : " + error.request.responseType.toString());
  }
}
