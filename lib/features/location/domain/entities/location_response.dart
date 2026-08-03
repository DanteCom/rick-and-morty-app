import 'package:rick_and_morty/features/location/data/models/models.dart';
import 'package:rick_and_morty/features/location/domain/entities/location.dart';

class LocationResponse {
  final List<Location> locations;
  final LocationPageInfoModel info;

  const LocationResponse({required this.locations, required this.info});

  LocationResponse copyWith({
    List<Location>? locations,
    LocationPageInfoModel? info,
  }) {
    return LocationResponse(
      locations: locations ?? this.locations,
      info: info ?? this.info,
    );
  }
}

class LocationPageInfo {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  const LocationPageInfo({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });
}
