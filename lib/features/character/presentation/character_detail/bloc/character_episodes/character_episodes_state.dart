part of 'character_episodes_bloc.dart';

@freezed
sealed class CharacterEpisodesState with _$CharacterEpisodesState {
  const factory CharacterEpisodesState.initial() = _Initial;
  const factory CharacterEpisodesState.loading() = _Loading;
  const factory CharacterEpisodesState.success(List<Episode> episodes) =
      _Success;
  const factory CharacterEpisodesState.error(AppFailure failure) = _Error;
}
