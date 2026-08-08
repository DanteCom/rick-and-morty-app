import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/core/result/result.dart';
import 'package:rick_and_morty/features/location/domain/entities/location.dart';
import 'package:rick_and_morty/features/location/domain/location_repository.dart';

part 'location_detail_event.dart';
part 'location_detail_state.dart';
part 'location_detail_bloc.freezed.dart';

@injectable
class LocationDetailBloc
    extends Bloc<LocationDetailEvent, LocationDetailState> {
  final LocationRepository _repository;
  LocationDetailBloc(this._repository) : super(_Initial()) {
    on<_Started>(_onStarted);
  }

  Future<void> _onStarted(
    _Started event,
    Emitter<LocationDetailState> emit,
  ) async {
    emit(_Loading());

    final result = await _repository.getLocation(event.id);

    result.when(
      success: (data) => emit(_Success(data)),
      error: (failure) => emit(_Error(failure)),
    );
  }
}
