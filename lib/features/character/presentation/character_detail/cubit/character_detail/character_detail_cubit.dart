import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/result/result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/features/character/domain/character_repository.dart';
import 'package:rick_and_morty/features/character/domain/entities/character.dart';

part 'character_detail_state.dart';
part 'character_detail_cubit.freezed.dart';

@injectable
class CharacterDetailCubit extends Cubit<CharacterDetailState> {
  final CharacterRepository _repo;

  CharacterDetailCubit(this._repo)
    : super(const CharacterDetailState.loading());

  Future<void> started(int id) async {
    final result = await _repo.getCharacter(id);

    result.when(
      success: (data) => emit(CharacterDetailState.success(data)),
      error: (failure) => emit(CharacterDetailState.error(failure)),
    );
  }
}
