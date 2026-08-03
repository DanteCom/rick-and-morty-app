part of 'locations_search_bloc.dart';

@freezed
sealed class LocationsSearchEvent with _$LocationsSearchEvent {
  const factory LocationsSearchEvent.search(String name) = _Search;
}
