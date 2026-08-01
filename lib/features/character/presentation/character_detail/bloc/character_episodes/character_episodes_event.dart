part of 'character_episodes_bloc.dart';

@freezed
sealed class CharacterEpisodesEvent with _$CharacterEpisodesEvent {
  const factory CharacterEpisodesEvent.started(List<String> episodes) =
      _Started;
}
