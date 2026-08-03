part of 'location_residents_bloc.dart';

@freezed
sealed class LocationResidentsEvent with _$LocationResidentsEvent {
  const factory LocationResidentsEvent.started(List<String> urls) = _Started;
}
