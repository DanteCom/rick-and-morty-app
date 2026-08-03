import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/core/result/result.dart';
import 'package:rick_and_morty/features/character/domain/character_repository.dart';
import 'package:rick_and_morty/features/character/domain/entities/character.dart';
import 'package:rick_and_morty/features/character/domain/entities/character_response.dart';
import 'package:rick_and_morty/shared/states/async_state.dart';

part 'characters_state.dart';
part 'characters_event.dart';

part 'characters_bloc.freezed.dart';

@injectable
class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final CharacterRepository _repo;

  CharactersBloc(this._repo) : super(CharactersState.initial()) {
    on<_Started>(_onStarted);
    on<_LoadMore>(_onLoadMore);
  }

  Future<void> _onStarted(_Started event, Emitter<CharactersState> emit) async {
    final result = await _repo.getInitialPage();

    result.when(
      success: (data) => emit(CharactersState.success(response: data)),
      error: (failure) => emit(CharactersState.error(failure)),
    );
  }

  Future<void> _onLoadMore(
    _LoadMore event,
    Emitter<CharactersState> emit,
  ) async {
    final currentState = state;
    if (currentState is! _Success) return;

    if (!currentState.canLoadMore) return;

    emit(currentState.copyWith(loadMoreState: AsyncState.loading()));

    final result = await _repo.getNextPage(event.url);

    print(event.url);

    result.when(
      success: (data) {
        final characters = <Character>[
          ...currentState.response.characters,
          ...data.characters,
        ];

        emit(
          currentState.copyWith(
            response: data.copyWith(characters: characters),
            loadMoreState: AsyncState.idle(),
          ),
        );
      },
      error: (failure) =>
          emit(currentState.copyWith(loadMoreState: AsyncState.error(failure))),
    );
  }
}
