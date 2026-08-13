part of 'episode_detail_cubit.dart';

@freezed
class EpisodeDetailState with _$EpisodeDetailState {
  const factory EpisodeDetailState.loading() = _Loading;
  const factory EpisodeDetailState.success(Episode episode) = _Success;
  const factory EpisodeDetailState.error(AppFailure failure) = _Failure;
}
