import 'package:doggies_app/models/dog_model.dart';
import 'package:doggies_app/services/api/dog_api.dart';
import 'package:dio/dio.dart';

// Dog service using singleton pattern
class DogService {
  static final DogService _instance = DogService._internal();
  final Dio _dio = Dio();
  DogApi _api;
  bool isLoaded = false;

  List<DogModel> _data;

  List<DogModel> get dogs => List<DogModel>.from(_data);

  factory DogService() {
    return _instance;
  }

  DogService._internal() {
    this._dio.options.headers = {"content-type": "application/json"};
    this._api = DogApi(_dio);
    fetch();
  }

  Future<void> fetch() async {
    try {
      List<DogModel> newDogs = [];
      Map<String, List<String>> allBreeds = await _getAllBreeds();
      var breeds = allBreeds.keys.toList();
      for (int i = 0; i < breeds.length; i++) {
        var breedModel = await breedToModel(breed: breeds[i]);
        newDogs.add(breedModel);
        if (allBreeds[breeds[i]].length > 0)
          for (int j = 0; j < allBreeds[breeds[i]].length; j++) {
            var subBreedModel = await subBreedToModel(breed: breeds[i], subBreed: allBreeds[breeds[i]][j]);
            newDogs.add(subBreedModel);
          }
      }
      newDogs.length > 0 ? isLoaded = true : isLoaded = false;
      _data = newDogs;
    } catch (error) {
      isLoaded = false;
      rethrow;
    }
  }

  Future<DogModel> breedToModel({String breed}) async {
    String info = "No description provided.";
    String image;
    try {
      image = await _getRandomBreedImage(breed: breed);
      info = (await _getBreedInfo(breed: breed))["info"];
      return DogModel(breed: breed, subBreed: "none", image: image, description: info);
    } catch (error) {
      DioError err = error as DioError;
      if (err.response.statusCode == 404)
        return DogModel(breed: breed, subBreed: "none", image: image, description: info);
      else
        rethrow;
    }
  }

  Future<DogModel> subBreedToModel({String breed, String subBreed}) async {
    String info = "No description provided.";
    String image;
    try {
      image = await _getRandomSubBreedImage(breed: breed, subBreed: subBreed);
      info = (await _getSubBreedInfo(breed: breed, subBreed: subBreed))["info"];
      return DogModel(breed: breed, subBreed: subBreed, image: image, description: info);
    } catch (error) {
      DioError err = error as DioError;
      if (err.response.statusCode == 404)
        return DogModel(breed: breed, subBreed: subBreed, image: image, description: info);
      else
        rethrow;
    }
  }

  Future<Map<String, List<String>>> _getAllBreeds() async {
    try {
      GetAllBreedsResponse response = await this._api.getAllBreeds();
      return response.message;
    } catch (error) {
      rethrow;
    }
  }

  Future<Map<String, String>> _getBreedInfo({String breed}) async {
    try {
      GetBreedInfoResponse response = await this._api.getBreedInfo(breed);
      return response.message;
    } catch (error) {
      rethrow;
    }
  }

  Future<Map<String, String>> _getSubBreedInfo({String breed, String subBreed}) async {
    try {
      GetBreedInfoResponse response = await this._api.getSubBreedInfo(breed, subBreed);
      return response.message;
    } catch (error) {
      rethrow;
    }
  }

  Future<String> _getRandomBreedImage({String breed}) async {
    try {
      GetBreedImageResponse response = await this._api.getRandomBreedImage(breed);
      return response.message;
    } catch (error) {
      rethrow;
    }
  }

  Future<String> _getRandomSubBreedImage({String breed, String subBreed}) async {
    try {
      GetBreedImageResponse response = await this._api.getRandomSubBreedImage(breed, subBreed);
      return response.message;
    } catch (error) {
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
