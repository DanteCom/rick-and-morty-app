import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/core/result/result.dart';
import 'package:rick_and_morty/features/character/domain/character_repository.dart';
import 'package:rick_and_morty/features/character/domain/entities/character_response.dart';

part 'characters_search_event.dart';
part 'characters_search_state.dart';

part 'characters_search_bloc.freezed.dart';

@injectable
class CharactersSearchBloc
    extends Bloc<CharactersSearchEvent, CharactersSearchState> {
  final CharacterRepository _repo;
  CharactersSearchBloc(this._repo) : super(CharactersSearchState.idle()) {
    on<_Search>(_onSearch);
  }

  Future<void> _onSearch(
    _Search event,
    Emitter<CharactersSearchState> emit,
  ) async {
    final name = event.name.trim();

    if (name.isEmpty) {
      emit(CharactersSearchState.idle());
      return;
    }

    final result = await _repo.searchCharacter(name);

    await result.when(
      success: (data) {
        emit(CharactersSearchState.success(data));
      },
      error: (failure) {
        emit(CharactersSearchState.error(failure));
      },
    );
  }
}
