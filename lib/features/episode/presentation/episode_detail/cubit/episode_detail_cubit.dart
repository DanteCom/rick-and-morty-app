import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/core/result/result.dart';
import 'package:rick_and_morty/features/episode/domain/entities/episode.dart';
import 'package:rick_and_morty/features/episode/domain/episode_repository.dart';

part 'episode_detail_state.dart';
part 'episode_detail_cubit.freezed.dart';

@injectable
class EpisodeDetailCubit extends Cubit<EpisodeDetailState> {
  final EpisodeRepository _repository;

  EpisodeDetailCubit(this._repository)
    : super(const EpisodeDetailState.loading());

  Future<void> load(int id) async {
    final result = await _repository.getEpisode(id);

    result.when(
      success: (data) => emit(EpisodeDetailState.success(data)),
      error: (failure) => emit(EpisodeDetailState.error(failure)),
    );
  }
}
