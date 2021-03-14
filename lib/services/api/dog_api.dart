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
  @GET("breed/{breed}")
  Future<GetBreedInfoResponse> getBreedInfo(@Path("breed") String breed);
  @GET("breed/{breed}/{subBreed}")
  Future<GetBreedInfoResponse> getSubBreedInfo(@Path("breed") String breed, @Path("subBreed") String subBreed);
  @GET("breed/{breed}/images/random")
  Future<GetBreedImageResponse> getRandomBreedImage(@Path("breed") String breed);
  @GET("breed/{breed}/{subBreed}/images/random")
  Future<GetBreedImageResponse> getRandomSubBreedImage(@Path("breed") String breed, @Path("subBreed") String subBreed);
}

@JsonSerializable()
class GetAllBreedsResponse {
  Map<String, List<String>> message;
  String status;
  GetAllBreedsResponse({this.message, this.status});
  factory GetAllBreedsResponse.fromJson(Map<String, dynamic> json) => _$GetAllBreedsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetAllBreedsResponseToJson(this);
}

@JsonSerializable()
class GetBreedInfoResponse {
  Map<String, String> message;
  String status;
  GetBreedInfoResponse({this.message, this.status});
  factory GetBreedInfoResponse.fromJson(Map<String, dynamic> json) => _$GetBreedInfoResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetBreedInfoResponseToJson(this);
}

@JsonSerializable()
class GetBreedImageResponse {
  String message;
  String status;
  GetBreedImageResponse({this.message, this.status});
  factory GetBreedImageResponse.fromJson(Map<String, dynamic> json) => _$GetBreedImageResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetBreedImageResponseToJson(this);
}