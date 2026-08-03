part of 'location_detail_bloc.dart';

@freezed
sealed class LocationDetailEvent with _$LocationDetailEvent {
  const factory LocationDetailEvent.started(int id) = _Started;
}
