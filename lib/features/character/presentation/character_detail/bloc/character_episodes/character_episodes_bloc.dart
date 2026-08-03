import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/result/result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/features/episode/domain/episode.dart';
import 'package:rick_and_morty/features/episode/domain/episode_repository.dart';

part 'character_episodes_event.dart';
part 'character_episodes_state.dart';

part 'character_episodes_bloc.freezed.dart';

@injectable
class CharacterEpisodesBloc
    extends Bloc<CharacterEpisodesEvent, CharacterEpisodesState> {
  final EpisodeRepository _episodesRepo;

  CharacterEpisodesBloc(this._episodesRepo)
    : super(CharacterEpisodesState.initial()) {
    on<_Started>(_onStarted);
  }

  Future<void> _onStarted(
    _Started event,
    Emitter<CharacterEpisodesState> emit,
  ) async {
    final result = await _episodesRepo.getEpisodesByUrls(event.episodes);

    result.when(
      success: (data) => emit(CharacterEpisodesState.success(data)),
      error: (failure) => emit(CharacterEpisodesState.error(failure)),
    );
  }
}
