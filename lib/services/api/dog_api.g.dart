// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllBreedsResponse _$GetAllBreedsResponseFromJson(Map<String, dynamic> json) {
  return GetAllBreedsResponse(
    message: (json['message'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => e as String)?.toList()),
    ),
    status: json['status'] as String,
  )..code = json['code'] as int;
}

Map<String, dynamic> _$GetAllBreedsResponseToJson(
        GetAllBreedsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'code': instance.code,
    };

GetBreedInfoResponse _$GetBreedInfoResponseFromJson(Map<String, dynamic> json) {
  return GetBreedInfoResponse(
    message: (json['message'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    status: json['status'] as String,
  )..code = json['code'] as int;
}

Map<String, dynamic> _$GetBreedInfoResponseToJson(
        GetBreedInfoResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'code': instance.code,
    };

GetBreedImageResponse _$GetBreedImageResponseFromJson(
    Map<String, dynamic> json) {
  return GetBreedImageResponse(
    message: json['message'] as String,
    status: json['status'] as String,
  )..code = json['code'] as int;
}

Map<String, dynamic> _$GetBreedImageResponseToJson(
        GetBreedImageResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'code': instance.code,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _DogApi implements DogApi {
  _DogApi(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://dog.ceo/api/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<GetAllBreedsResponse> getAllBreeds() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('breeds/list/all',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GetAllBreedsResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<GetBreedInfoResponse> getBreedInfo(breed) async {
    ArgumentError.checkNotNull(breed, 'breed');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('breed/$breed',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GetBreedInfoResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<GetBreedInfoResponse> getSubBreedInfo(breed, subBreed) async {
    ArgumentError.checkNotNull(breed, 'breed');
    ArgumentError.checkNotNull(subBreed, 'subBreed');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'breed/$breed/$subBreed',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GetBreedInfoResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<GetBreedImageResponse> getRandomBreedImage(breed) async {
    ArgumentError.checkNotNull(breed, 'breed');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'breed/$breed/images/random',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GetBreedImageResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<GetBreedImageResponse> getRandomSubBreedImage(breed, subBreed) async {
    ArgumentError.checkNotNull(breed, 'breed');
    ArgumentError.checkNotNull(subBreed, 'subBreed');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'breed/$breed/$subBreed/images/random',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GetBreedImageResponse.fromJson(_result.data);
    return value;
  }
}
