part of 'episode_character_cubit.dart';

@freezed
class EpisodeCharacterState with _$EpisodeCharacterState {
  const factory EpisodeCharacterState.loading() = _Loading;
  const factory EpisodeCharacterState.success(List<Character> characters) =
      _Success;
  const factory EpisodeCharacterState.error(AppFailure failure) = _Error;
}
