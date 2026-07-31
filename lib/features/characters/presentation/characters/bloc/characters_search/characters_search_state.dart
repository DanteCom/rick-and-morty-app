part of 'characters_search_bloc.dart';

@freezed
sealed class CharactersSearchState with _$CharactersSearchState {
  const factory CharactersSearchState.idle() = _Idle;
  const factory CharactersSearchState.success(CharacterResponse response) =
      _Success;
  const factory CharactersSearchState.error(AppFailure failure) = _Error;
}
