import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/core/result/result.dart';
import 'package:rick_and_morty/features/character/domain/character_repository.dart';
import 'package:rick_and_morty/features/character/domain/entities/character_response.dart';

part 'characters_search_state.dart';
part 'character_search_cubit.freezed.dart';

@injectable
class CharacterSearchCubit extends Cubit<CharacterSearchState> {
  final CharacterRepository _repo;
  CharacterSearchCubit(this._repo) : super(const CharacterSearchState.idle());

  Future<void> search(String name) async {
    if (name.isEmpty) {
      emit(const CharacterSearchState.idle());
      return;
    }

    final result = await _repo.searchCharacters(name);

    await result.when(
      success: (data) {
        emit(CharacterSearchState.success(data));
      },
      error: (failure) {
        emit(CharacterSearchState.error(failure));
      },
    );
  }
}
