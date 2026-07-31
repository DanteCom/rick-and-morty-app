part of 'character_detail_bloc.dart';

@freezed
sealed class CharacterDetailEvent with _$CharacterDetailEvent {
  const factory CharacterDetailEvent.started(int id) = _Started;
}
