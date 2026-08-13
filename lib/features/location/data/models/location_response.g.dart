// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocationResponseModel _$LocationResponseModelFromJson(
  Map<String, dynamic> json,
) => _LocationResponseModel(
  results: (json['results'] as List<dynamic>)
      .map((e) => LocationModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  info: LocationPageInfoModel.fromJson(json['info'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LocationResponseModelToJson(
  _LocationResponseModel instance,
) => <String, dynamic>{'results': instance.results, 'info': instance.info};

_LocationPageInfoModel _$LocationPageInfoModelFromJson(
  Map<String, dynamic> json,
) => _LocationPageInfoModel(
  count: (json['count'] as num).toInt(),
  pages: (json['pages'] as num).toInt(),
  next: json['next'] as String?,
  prev: json['prev'] as String?,
);

Map<String, dynamic> _$LocationPageInfoModelToJson(
  _LocationPageInfoModel instance,
) => <String, dynamic>{
  'count': instance.count,
  'pages': instance.pages,
  'next': instance.next,
  'prev': instance.prev,
};
