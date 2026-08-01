// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

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

_CharacterModel _$CharacterModelFromJson(
  Map<String, dynamic> json,
) => _CharacterModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  status: json['status'] as String,
  species: json['species'] as String,
  type: json['type'] as String,
  gender: json['gender'] as String,
  origin: CharacterOriginModel.fromJson(json['origin'] as Map<String, dynamic>),
  location: CharacterOriginModel.fromJson(
    json['location'] as Map<String, dynamic>,
  ),
  image: json['image'] as String,
  episode: (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
  url: json['url'] as String,
  created: json['created'] as String,
);

Map<String, dynamic> _$CharacterModelToJson(_CharacterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'type': instance.type,
      'gender': instance.gender,
      'origin': instance.origin,
      'location': instance.location,
      'image': instance.image,
      'episode': instance.episode,
      'url': instance.url,
      'created': instance.created,
    };

_CharacterOriginModel _$CharacterOriginModelFromJson(
  Map<String, dynamic> json,
) => _CharacterOriginModel(
  name: json['name'] as String,
  url: json['url'] as String,
);

Map<String, dynamic> _$CharacterOriginModelToJson(
  _CharacterOriginModel instance,
) => <String, dynamic>{'name': instance.name, 'url': instance.url};
