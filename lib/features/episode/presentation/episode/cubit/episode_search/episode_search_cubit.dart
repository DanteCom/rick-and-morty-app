import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/core/result/result.dart';
import 'package:rick_and_morty/features/episode/domain/entities/episode_response.dart';
import 'package:rick_and_morty/features/episode/domain/episode_repository.dart';

part 'episode_search_state.dart';
part 'episode_search_cubit.freezed.dart';

@injectable
class EpisodeSearchCubit extends Cubit<EpisodeSearchState> {
  final EpisodeRepository _repository;

  EpisodeSearchCubit(this._repository) : super(const EpisodeSearchState.idle());

  Future<void> search(String name) async {
    if (name.isEmpty) {
      emit(const _Idle());
      return;
    }

    final result = await _repository.searchEpisodes(name);

    await result.when(
      success: (data) {
        emit(_Success(data));
      },
      error: (failure) {
        emit(_Error(failure));
      },
    );
  }
}
