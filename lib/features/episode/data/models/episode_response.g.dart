// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EpisodeResponseModel _$EpisodeResponseModelFromJson(
  Map<String, dynamic> json,
) => _EpisodeResponseModel(
  results: (json['results'] as List<dynamic>)
      .map((e) => EpisodeModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  info: EpisodePageInfoModel.fromJson(json['info'] as Map<String, dynamic>),
);

Map<String, dynamic> _$EpisodeResponseModelToJson(
  _EpisodeResponseModel instance,
) => <String, dynamic>{'results': instance.results, 'info': instance.info};

_EpisodePageInfoModel _$EpisodePageInfoModelFromJson(
  Map<String, dynamic> json,
) => _EpisodePageInfoModel(
  count: (json['count'] as num).toInt(),
  pages: (json['pages'] as num).toInt(),
  next: json['next'] as String?,
  prev: json['prev'] as String?,
);

Map<String, dynamic> _$EpisodePageInfoModelToJson(
  _EpisodePageInfoModel instance,
) => <String, dynamic>{
  'count': instance.count,
  'pages': instance.pages,
  'next': instance.next,
  'prev': instance.prev,
};
