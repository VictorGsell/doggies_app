import 'package:doggies_app/services/api/dog_api.dart';
import 'package:dio/dio.dart';

final DogService dogService = DogService();

// Dog service using singleton pattern
class DogService {
  static final DogService _instance = DogService._internal();
  final Dio _dio = Dio();
  DogApi _api;

  factory DogService() {
    return _instance;
  }

  DogService._internal() {
    this._dio.options.headers = {"content-type": "application/json"};
    this._api = DogApi(_dio);
  }

  Future<Map<String, List<String>>> getAllBreeds() async {
    try {
      GetAllBreedsResponse response = await this._api.getAllBreeds();
      return response.message;
    } catch (error) {
      printDioErrorDetails(error);
      rethrow;
    }
  }

  Future<Map<String, String>> getBreedInfo({String breed}) async {
    try {
      GetBreedInfoResponse response = await this._api.getBreedInfo(breed);
      return response.message;
    } catch (error) {
      printDioErrorDetails(error);
      rethrow;
    }
  }

  Future<Map<String, String>> getSubBreedInfo({String breed, String subBreed}) async {
    try {
      GetBreedInfoResponse response = await this._api.getSubBreedInfo(breed, subBreed);
      return response.message;
    } catch (error) {
      printDioErrorDetails(error);
      rethrow;
    }
  }

  Future<String> getRandomBreedImage({String breed, String subBreed}) async {
    try {
      GetBreedImageResponse response = await this._api.getRandomBreedImage(breed);
      return response.message;
    } catch (error) {
      printDioErrorDetails(error);
      rethrow;
    }
  }

  Future<String> getRandomSubBreedImage({String breed, String subBreed}) async {
    try {
      GetBreedImageResponse response = await this._api.getRandomSubBreedImage(breed, subBreed);
      return response.message;
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
    print("content-type : " + error.request.contentType);
    print("data : " + error.request.data.toString());
    print("response-type : " + error.request.responseType.toString());
  }
}
