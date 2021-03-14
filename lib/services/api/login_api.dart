import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'dart:async';
part 'login_api.g.dart';

@RestApi(baseUrl: "https://reqres.in/api/")
abstract class LoginApi {
  factory LoginApi(Dio dio, {String baseUrl}) = _LoginApi;
  @POST("login")
  Future<LoginResponse> login(@Body() Credentials credentials);
}

@JsonSerializable()
class Credentials {
  String email;
  String password;
  Credentials({this.email, this.password});
  factory Credentials.fromJson(Map<String, dynamic> json) => _$CredentialsFromJson(json);
  Map<String, dynamic> toJson() => _$CredentialsToJson(this);
}

@JsonSerializable()
class LoginResponse {
  String token;
  LoginResponse({this.token});
  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}