import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/core/result/result.dart';
import 'package:rick_and_morty/features/characters/domain/characters_repo.dart';
import 'package:rick_and_morty/features/characters/domain/entities/character.dart';

part 'character_detail_event.dart';
part 'character_detail_state.dart';

part 'character_detail_bloc.freezed.dart';

@injectable
class CharacterDetailBloc
    extends Bloc<CharacterDetailEvent, CharacterDetailState> {
  final CharactersRepo _repo;

  CharacterDetailBloc(this._repo) : super(CharacterDetailState.initial()) {
    on<_Started>(_onStarted);
  }

  Future<void> _onStarted(
    _Started event,
    Emitter<CharacterDetailState> emit,
  ) async {
    emit(CharacterDetailState.loading());

    final result = await _repo.getCharacter(event.id);

    result.when(
      success: (data) => emit(CharacterDetailState.success(data)),
      error: (failure) => emit(CharacterDetailState.error(failure)),
    );
  }
}
