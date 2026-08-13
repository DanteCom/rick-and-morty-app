import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/core/failure/failure.dart';
import 'package:rick_and_morty/core/result/result.dart';
import 'package:rick_and_morty/features/episode/domain/entities/episode.dart';
import 'package:rick_and_morty/features/episode/domain/entities/episode_response.dart';
import 'package:rick_and_morty/features/episode/domain/episode_repository.dart';
import 'package:rick_and_morty/shared/states/async_state.dart';

part 'episode_state.dart';
part 'episode_cubit.freezed.dart';

@injectable
class EpisodeCubit extends Cubit<EpisodeState> {
  final EpisodeRepository _repository;
  EpisodeCubit(this._repository) : super(const EpisodeState.loading());

  Future<void> started() async {
    final result = await _repository.getInitialPage();

    result.when(
      success: (data) => emit(_Success(response: data)),
      error: (failure) => emit(_Error(failure)),
    );
  }

  Future<void> loadMore(String url) async {
    final currentState = state;
    if (currentState is! _Success) return;

    if (!currentState.canLoadMore) return;

    emit(currentState.copyWith(loadMoreState: const AsyncState.loading()));

    final result = await _repository.getNextPage(url);

    result.when(
      success: (data) {
        final episodes = <Episode>[
          ...currentState.response.episodes,
          ...data.episodes,
        ];

        emit(
          currentState.copyWith(
            response: data.copyWith(episodes: episodes),
            loadMoreState: const AsyncState.idle(),
          ),
        );
      },
      error: (failure) =>
          emit(currentState.copyWith(loadMoreState: AsyncState.error(failure))),
    );
  }
}
