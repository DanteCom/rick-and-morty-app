import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/result/result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/shared/states/async_state.dart';
import 'package:rick_and_morty/features/character/domain/entities/character.dart';
import 'package:rick_and_morty/features/character/domain/character_repository.dart';
import 'package:rick_and_morty/features/character/domain/entities/character_response.dart';

part 'character_state.dart';
part 'character_cubit.freezed.dart';

@injectable
class CharacterCubit extends Cubit<CharacterState> {
  final CharacterRepository _repo;

  CharacterCubit(this._repo) : super(const CharacterState.loading());

  Future<void> started() async {
    final result = await _repo.getInitialPage();

    result.when(
      success: (data) => emit(CharacterState.success(response: data)),
      error: (failure) => emit(CharacterState.error(failure)),
    );
  }

  Future<void> loadMore(String url) async {
    final currentState = state;
    if (currentState is! _Success) return;

    if (!currentState.canLoadMore) return;

    emit(currentState.copyWith(loadMoreState: const AsyncState.loading()));

    final result = await _repo.getNextPage(url);

    result.when(
      success: (data) {
        final characters = <Character>[
          ...currentState.response.characters,
          ...data.characters,
        ];

        emit(
          currentState.copyWith(
            response: data.copyWith(characters: characters),
            loadMoreState: const AsyncState.idle(),
          ),
        );
      },
      error: (failure) =>
          emit(currentState.copyWith(loadMoreState: AsyncState.error(failure))),
    );
  }
}
