import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/features/location/domain/entities/location.dart';

part 'location.g.dart';
part 'location.freezed.dart';

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
