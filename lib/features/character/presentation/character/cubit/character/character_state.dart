part of 'character_cubit.dart';

@freezed
sealed class CharacterState with _$CharacterState {
  const factory CharacterState.loading() = _Loading;
  const factory CharacterState.success({
    required CharacterResponse response,
    @Default(AsyncState.idle()) AsyncState<AppFailure> loadMoreState,
  }) = _Success;
  const factory CharacterState.error(AppFailure failure) = _Error;

  const CharacterState._();

  bool get canLoadMore => maybeWhen(
    success: (response, loadMoreState) => response.info.next != null
        ? loadMoreState.maybeWhen(loading: () => false, orElse: () => true)
        : false,
    orElse: () => false,
  );
}
