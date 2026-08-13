// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CharacterResponseModel _$CharacterResponseModelFromJson(
  Map<String, dynamic> json,
) => _CharacterResponseModel(
  info: CharacterPageInfoModel.fromJson(json['info'] as Map<String, dynamic>),
  results: (json['results'] as List<dynamic>)
      .map((e) => CharacterModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CharacterResponseModelToJson(
  _CharacterResponseModel instance,
) => <String, dynamic>{'info': instance.info, 'results': instance.results};

_CharacterPageInfoModel _$CharacterPageInfoModelFromJson(
  Map<String, dynamic> json,
) => _CharacterPageInfoModel(
  count: (json['count'] as num).toInt(),
  pages: (json['pages'] as num).toInt(),
  next: json['next'] as String?,
  prev: json['prev'] as String?,
);

Map<String, dynamic> _$CharacterPageInfoModelToJson(
  _CharacterPageInfoModel instance,
) => <String, dynamic>{
  'count': instance.count,
  'pages': instance.pages,
  'next': instance.next,
  'prev': instance.prev,
};
