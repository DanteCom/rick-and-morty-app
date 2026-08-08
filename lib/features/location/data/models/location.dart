part of 'models.dart';

@freezed
abstract class LocationModel with _$LocationModel {
  const factory LocationModel({
    required int id,
    required String name,
    required String type,
    required String dimension,
    required List<String> residents,
    required String url,
    required String created,
  }) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  const LocationModel._();

  Location toEntity() => Location(
    id: id,
    name: name,
    type: type,
    dimension: dimension,
    residentUrls: residents,
    url: url,
    created: created,
  );
}
