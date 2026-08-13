part of 'episode_cubit.dart';

@freezed
class EpisodeState with _$EpisodeState {
  const factory EpisodeState.loading() = _Loading;

  const factory EpisodeState.success({
    required EpisodeResponse response,
    @Default(AsyncState.idle()) AsyncState loadMoreState,
  }) = _Success;

  const factory EpisodeState.error(AppFailure failure) = _Error;

  const EpisodeState._();

  bool get canLoadMore => maybeWhen(
    success: (response, loadMoreState) => response.info.next != null
        ? loadMoreState.maybeWhen(loading: () => false, orElse: () => true)
        : false,
    orElse: () => false,
  );
}
