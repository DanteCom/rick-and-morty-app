part of 'location_residents_cubit.dart';

@freezed
class LocationResidentsState with _$LocationResidentsState {
  const factory LocationResidentsState.loading() = _Loading;
  const factory LocationResidentsState.success(List<Character> characters) =
      _Success;
  const factory LocationResidentsState.error(AppFailure failure) = _Error;
}
