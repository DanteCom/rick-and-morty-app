import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/core/result/result.dart';
import 'package:rick_and_morty/features/location/domain/entities/location_response.dart';
import 'package:rick_and_morty/features/location/domain/location_repository.dart';
import 'package:rick_and_morty/shared/states/async_state.dart';

part 'location_state.dart';
part 'location_cubit.freezed.dart';

@injectable
class LocationCubit extends Cubit<LocationState> {
  final LocationRepository _repository;
  LocationCubit(this._repository) : super(const LocationState.loading());

  Future<void> started() async {
    final result = await _repository.getInitialPage();

    result.when(
      success: (data) => emit(LocationState.success(response: data)),
      error: (failure) => emit(LocationState.error(failure)),
    );
  }

  Future<void> loadMore(String url) async {
    final currentState = state;
    if (currentState is! _Success) return;

    if (!currentState.canLoadMore) return;

    emit(currentState.copyWith(loadMoreState: const AsyncState.loading()));

    final result = await _repository.getNextPage(url);

    result.when(
      success: (data) {
        final locations = [
          ...currentState.response.locations,
          ...data.locations,
        ];

        emit(
          LocationState.success(response: data.copyWith(locations: locations)),
        );
      },
      error: (failure) => emit(LocationState.error(failure)),
    );
  }
}
