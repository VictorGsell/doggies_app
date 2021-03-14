import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'dart:async';
part 'dog_api.g.dart';

@RestApi(baseUrl: "https://dog.ceo/api/")
abstract class DogApi {
  factory DogApi(Dio dio, {String baseUrl}) = _DogApi;
  @GET("breeds/list/all")
  Future<GetAllBreedsResponse> getAllBreeds();
}

@JsonSerializable()
class GetAllBreedsResponse {
  Map<String, List<String>> message;
  String status;
  GetAllBreedsResponse({this.message, this.status});
  factory GetAllBreedsResponse.fromJson(Map<String, dynamic> json) => _$GetAllBreedsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetAllBreedsResponseToJson(this);
}