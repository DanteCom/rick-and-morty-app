part of 'characters_bloc.dart';

@freezed
sealed class CharactersState with _$CharactersState {
  const factory CharactersState.initial() = _Initial;
  const factory CharactersState.loading() = _Loading;
  const factory CharactersState.success({
    required CharacterResponse response,
    @Default(AsyncState.idle()) AsyncState<AppFailure> loadMoreState,
  }) = _Success;
  const factory CharactersState.error(AppFailure failure) = _Error;

  const CharactersState._();

  bool get canLoadMore => maybeWhen(
    success: (response, loadMoreState) =>
        loadMoreState.maybeWhen(loading: () => false, orElse: () => true),
    orElse: () => true,
  );
}
