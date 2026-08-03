import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/core/result/result.dart';
import 'package:rick_and_morty/features/location/domain/entities/location_response.dart';
import 'package:rick_and_morty/features/location/domain/location_repository.dart';
import 'package:rick_and_morty/shared/states/async_state.dart';

part 'locations_event.dart';
part 'locations_state.dart';
part 'locations_bloc.freezed.dart';

@injectable
class LocationsBloc extends Bloc<LocationsEvent, LocationsState> {
  final LocationRepository _repository;
  LocationsBloc(this._repository) : super(LocationsState.initial()) {
    on<_Started>(_onStarted);
    on<_LoadMore>(_onLoadMore);
  }

  Future<void> _onStarted(_Started event, Emitter<LocationsState> emit) async {
    emit(_Loading());

    final result = await _repository.getInitialPage();

    result.when(
      success: (data) => emit(_Success(response: data)),
      error: (failure) => emit(_Error(failure)),
    );
  }

  Future<void> _onLoadMore(
    _LoadMore event,
    Emitter<LocationsState> emit,
  ) async {
    final currentState = state;
    if (currentState is! _Success) return;

    if (!currentState.canLoadMore) return;

    emit(currentState.copyWith(loadMoreState: AsyncState.loading()));

    final result = await _repository.getNextPage(event.url);

    result.when(
      success: (data) {
        final locations = [
          ...currentState.response.locations,
          ...data.locations,
        ];

        emit(_Success(response: data.copyWith(locations: locations)));
      },
      error: (failure) => emit(_Error(failure)),
    );
  }
}
