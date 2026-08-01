part of 'models.dart';

@freezed
abstract class CharacterModel with _$CharacterModel {
  const factory CharacterModel({
    required int id,
    required String name,
    required String status,
    required String species,
    required String type,
    required String gender,
    required CharacterOriginModel origin,
    required CharacterOriginModel location,
    required String image,
    required List<String> episode,
    required String url,
    required String created,
  }) = _CharacterModel;

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  const CharacterModel._();

  Character toEntity() => Character(
    id: id,
    name: name,
    status: CharacterStatus.values.firstWhere(
      (element) => element.name == status.toLowerCase(),
      orElse: () => CharacterStatus.unknown,
    ),
    species: species,
    type: type,
    gender: CharacterGender.values.firstWhere(
      (element) => element.name == gender.toLowerCase(),
      orElse: () => CharacterGender.unknown,
    ),
    origin: origin.toEntity(),
    location: location.toEntity(),
    image: image,
    episodeUrls: episode,
    url: url,
    created: DateTime.parse(created),
  );
}

@freezed
abstract class CharacterOriginModel with _$CharacterOriginModel {
  const factory CharacterOriginModel({
    required String name,
    required String url,
  }) = _CharacterOriginModel;

  factory CharacterOriginModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterOriginModelFromJson(json);

  const CharacterOriginModel._();

  CharacterOrigin toEntity() => CharacterOrigin(name: name, url: url);
}
