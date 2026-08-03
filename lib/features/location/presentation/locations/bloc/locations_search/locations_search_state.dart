part of 'locations_search_bloc.dart';

@freezed
class LocationsSearchState with _$LocationsSearchState {
  const factory LocationsSearchState.idle() = _Idle;
  const factory LocationsSearchState.success(LocationResponse response) =
      _Success;
  const factory LocationsSearchState.error(AppFailure failure) = _Error;
}
