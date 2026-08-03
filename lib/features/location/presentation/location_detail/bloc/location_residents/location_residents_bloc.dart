import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/core/result/result.dart';
import 'package:rick_and_morty/features/character/domain/character_repository.dart';
import 'package:rick_and_morty/features/character/domain/entities/character.dart';

part 'location_residents_event.dart';
part 'location_residents_state.dart';
part 'location_residents_bloc.freezed.dart';

@injectable
class LocationResidentsBloc
    extends Bloc<LocationResidentsEvent, LocationResidentsState> {
  final CharacterRepository _repository;
  LocationResidentsBloc(this._repository)
    : super(LocationResidentsState.initial()) {
    on<_Started>(_onStarted);
  }

  Future<void> _onStarted(
    _Started event,
    Emitter<LocationResidentsState> emit,
  ) async {
    emit(_Loading());

    final result = await _repository.getCharactersByUrls(event.urls);

    result.when(
      success: (data) => emit(_Success(data)),
      error: (failure) => emit(_Error(failure)),
    );
  }
}
