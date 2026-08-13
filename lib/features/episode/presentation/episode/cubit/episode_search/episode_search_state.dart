part of 'episode_search_cubit.dart';

@freezed
class EpisodeSearchState with _$EpisodeSearchState {
  const factory EpisodeSearchState.idle() = _Idle;
  const factory EpisodeSearchState.success(EpisodeResponse response) = _Success;
  const factory EpisodeSearchState.error(AppFailure failure) = _Error;
}
