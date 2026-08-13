import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/features/location/data/models/location.dart';
import 'package:rick_and_morty/features/location/domain/entities/location_response.dart';

part 'location_response.g.dart';
part 'location_response.freezed.dart';

@freezed
abstract class LocationResponseModel with _$LocationResponseModel {
  const factory LocationResponseModel({
    required List<LocationModel> results,
    required LocationPageInfoModel info,
  }) = _LocationResponseModel;

  factory LocationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LocationResponseModelFromJson(json);

  const LocationResponseModel._();

  LocationResponse toEntity() => LocationResponse(
    locations: results.map((e) => e.toEntity()).toList(),
    info: info,
  );
}

@freezed
abstract class LocationPageInfoModel with _$LocationPageInfoModel {
  const factory LocationPageInfoModel({
    required int count,
    required int pages,
    required String? next,
    required String? prev,
  }) = _LocationPageInfoModel;

  factory LocationPageInfoModel.fromJson(Map<String, dynamic> json) =>
      _$LocationPageInfoModelFromJson(json);

  const LocationPageInfoModel._();

  LocationPageInfo toEntity() =>
      LocationPageInfo(count: count, pages: pages, next: next, prev: prev);
}
