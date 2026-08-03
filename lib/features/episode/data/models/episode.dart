part of 'models.dart';

@freezed
abstract class EpisodeModel with _$EpisodeModel {
  const factory EpisodeModel({
    required int id,
    required String name,
    required String? airDate,
    required String? episode,
    required List<String>? characters,
    required String url,
    required String created,
  }) = _EpisodeModel;

  factory EpisodeModel.fromJson(Map<String, Object?> json) =>
      _$EpisodeModelFromJson(json);

  const EpisodeModel._();

  Episode toEntity() => Episode(
    id: id,
    name: name,
    airDate: airDate,
    episode: episode,
    characters: characters ?? [],
    url: url,
    created: DateTime.parse(created),
  );
}
