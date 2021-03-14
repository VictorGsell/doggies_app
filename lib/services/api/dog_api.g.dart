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
  );
}

Map<String, dynamic> _$GetAllBreedsResponseToJson(
        GetAllBreedsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
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
}
