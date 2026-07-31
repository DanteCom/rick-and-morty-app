part of 'models.dart';

@freezed
abstract class CharacterResponseModel with _$CharacterResponseModel {
  const factory CharacterResponseModel({
    required CharacterPageInfoModel info,
    required List<CharacterModel> results,
  }) = _CharacterResponseModel;

  factory CharacterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterResponseModelFromJson(json);

  const CharacterResponseModel._();

  CharacterResponse toEntity() => CharacterResponse(
    info: info.toEntity(),
    characters: results.map((e) => e.toEntity()).toList(),
  );
}

@freezed
abstract class CharacterPageInfoModel with _$CharacterPageInfoModel {
  const factory CharacterPageInfoModel({
    required int count,
    required int pages,
    required String? next,
    required String? prev,
  }) = _CharacterPageInfoModel;

  factory CharacterPageInfoModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterPageInfoModelFromJson(json);

  const CharacterPageInfoModel._();

  CharacterPageInfo toEntity() =>
      CharacterPageInfo(count: count, pages: pages, next: next, prev: prev);
}
