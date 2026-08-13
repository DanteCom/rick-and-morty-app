part of 'location_detail_cubit.dart';

@freezed
class LocationDetailState with _$LocationDetailState {
  const factory LocationDetailState.loading() = _Loading;
  const factory LocationDetailState.success(Location location) = _Success;
  const factory LocationDetailState.error(AppFailure failure) = _Error;
}
