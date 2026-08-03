part of 'location_residents_bloc.dart';

@freezed
class LocationResidentsState with _$LocationResidentsState {
  const factory LocationResidentsState.initial() = _Initial;
  const factory LocationResidentsState.loading() = _Loading;
  const factory LocationResidentsState.success(List<Character> characters) =
      _Success;
  const factory LocationResidentsState.error(AppFailure failure) = _Error;
}
