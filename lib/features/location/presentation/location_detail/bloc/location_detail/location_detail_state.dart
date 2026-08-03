part of 'location_detail_bloc.dart';

@freezed
class LocationDetailState with _$LocationDetailState {
  const factory LocationDetailState.initial() = _Initial;
  const factory LocationDetailState.loading() = _Loading;
  const factory LocationDetailState.success(Location location) = _Success;
  const factory LocationDetailState.error(AppFailure failure) = _Error;
}
