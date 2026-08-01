part of 'characters_search_bloc.dart';

@freezed
sealed class CharactersSearchEvent with _$CharactersSearchEvent {
  const factory CharactersSearchEvent.search(String name) = _Search;
}
