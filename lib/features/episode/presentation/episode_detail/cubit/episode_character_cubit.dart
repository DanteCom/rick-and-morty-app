import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/core/result/result.dart';
import 'package:rick_and_morty/features/character/domain/character_repository.dart';
import 'package:rick_and_morty/features/character/domain/entities/character.dart';

part 'episode_character_state.dart';
part 'episode_character_cubit.freezed.dart';

@injectable
class EpisodeCharacterCubit extends Cubit<EpisodeCharacterState> {
  final CharacterRepository _repository;

  EpisodeCharacterCubit(this._repository)
    : super(const EpisodeCharacterState.loading());

  Future<void> load(List<String> characters) async {
    final result = await _repository.getCharactersByUrls(characters);

    result.when(
      success: (data) => emit(EpisodeCharacterState.success(data)),
      error: (failure) => emit(EpisodeCharacterState.error(failure)),
    );
  }
}
