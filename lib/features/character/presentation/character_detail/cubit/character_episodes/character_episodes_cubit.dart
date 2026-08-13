import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/result/result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/features/episode/domain/entities/episode.dart';
import 'package:rick_and_morty/features/episode/domain/episode_repository.dart';

part 'character_episodes_state.dart';
part 'character_episodes_cubit.freezed.dart';

@injectable
class CharacterEpisodesCubit extends Cubit<CharacterEpisodesState> {
  final EpisodeRepository _episodesRepo;

  CharacterEpisodesCubit(this._episodesRepo)
    : super(const CharacterEpisodesState.loading());

  Future<void> load(List<String> episodes) async {
    final result = await _episodesRepo.getEpisodesByUrls(episodes);

    result.when(
      success: (data) => emit(CharacterEpisodesState.success(data)),
      error: (failure) => emit(CharacterEpisodesState.error(failure)),
    );
  }
}
