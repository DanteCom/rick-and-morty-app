import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/core/result/result.dart';
import 'package:rick_and_morty/features/location/domain/entities/location_response.dart';
import 'package:rick_and_morty/features/location/domain/location_repository.dart';

part 'locations_search_event.dart';
part 'locations_search_state.dart';
part 'locations_search_bloc.freezed.dart';

@injectable
class LocationsSearchBloc
    extends Bloc<LocationsSearchEvent, LocationsSearchState> {
  final LocationRepository _repository;
  LocationsSearchBloc(this._repository) : super(LocationsSearchState.idle()) {
    on<_Search>(_onSearch);
  }

  Future<void> _onSearch(
    _Search event,
    Emitter<LocationsSearchState> emit,
  ) async {
    final name = event.name.trim();

    if (name.isEmpty) {
      emit(_Idle());
      return;
    }

    final result = await _repository.searchLocation(name);

    result.when(
      success: (data) => emit(_Success(data)),
      error: (failure) => emit(_Error(failure)),
    );
  }
}
