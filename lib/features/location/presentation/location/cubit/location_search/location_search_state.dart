part of 'location_search_cubit.dart';

@freezed
class LocationSearchState with _$LocationSearchState {
  const factory LocationSearchState.idle() = _Idle;
  const factory LocationSearchState.success(LocationResponse response) =
      _Success;
  const factory LocationSearchState.error(AppFailure failure) = _Error;
}
