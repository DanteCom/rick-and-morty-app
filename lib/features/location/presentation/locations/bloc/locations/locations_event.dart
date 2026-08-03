part of 'locations_bloc.dart';

@freezed
class LocationsEvent with _$LocationsEvent {
  const factory LocationsEvent.started() = _Started;
  const factory LocationsEvent.loadMore(String url) = _LoadMore;
}
