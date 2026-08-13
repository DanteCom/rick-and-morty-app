import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/features/episode/data/models/episode.dart';
import 'package:rick_and_morty/features/episode/domain/entities/episode_response.dart';

part 'episode_response.g.dart';
part 'episode_response.freezed.dart';

@freezed
abstract class EpisodeResponseModel with _$EpisodeResponseModel {
  const factory EpisodeResponseModel({
    required List<EpisodeModel> results,
    required EpisodePageInfoModel info,
  }) = _EpisodeResponseModel;

  factory EpisodeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeResponseModelFromJson(json);

  const EpisodeResponseModel._();

  EpisodeResponse toEntity() => EpisodeResponse(
    episodes: results.map((e) => e.toEntity()).toList(),
    info: info.toEntity(),
  );
}

@freezed
abstract class EpisodePageInfoModel with _$EpisodePageInfoModel {
  const factory EpisodePageInfoModel({
    required int count,
    required int pages,
    required String? next,
    required String? prev,
  }) = _EpisodePageInfoModel;

  factory EpisodePageInfoModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodePageInfoModelFromJson(json);

  const EpisodePageInfoModel._();

  EpisodePageInfo toEntity() =>
      EpisodePageInfo(count: count, pages: pages, next: next, prev: prev);
}
