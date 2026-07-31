part of 'characters_bloc.dart';

@freezed
sealed class CharactersEvent with _$CharactersEvent {
  const factory CharactersEvent.started() = _Started;
  const factory CharactersEvent.loadMore(String url) = _LoadMore;
}
