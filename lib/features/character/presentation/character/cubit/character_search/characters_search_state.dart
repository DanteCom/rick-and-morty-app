part of 'character_search_cubit.dart';

@freezed
sealed class CharacterSearchState with _$CharacterSearchState {
  const factory CharacterSearchState.idle() = _Idle;
  const factory CharacterSearchState.success(CharacterResponse response) =
      _Success;
  const factory CharacterSearchState.error(AppFailure failure) = _Error;
}
