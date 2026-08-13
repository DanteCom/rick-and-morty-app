import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/core/result/result.dart';
import 'package:rick_and_morty/features/location/domain/entities/location_response.dart';
import 'package:rick_and_morty/features/location/domain/location_repository.dart';

part 'location_search_state.dart';
part 'location_search_cubit.freezed.dart';

@injectable
class LocationSearchCubit extends Cubit<LocationSearchState> {
  final LocationRepository _repository;
  LocationSearchCubit(this._repository)
    : super(const LocationSearchState.idle());

  Future<void> search(String name) async {
    if (name.isEmpty) {
      emit(const LocationSearchState.idle());
      return;
    }

    final result = await _repository.searchLocation(name);

    result.when(
      success: (data) => emit(LocationSearchState.success(data)),
      error: (failure) => emit(LocationSearchState.error(failure)),
    );
  }
}
