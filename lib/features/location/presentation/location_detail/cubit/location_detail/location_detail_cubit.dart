import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/core/result/result.dart';
import 'package:rick_and_morty/features/location/domain/entities/location.dart';
import 'package:rick_and_morty/features/location/domain/location_repository.dart';

part 'location_detail_state.dart';
part 'location_detail_cubit.freezed.dart';

@injectable
class LocationDetailCubit extends Cubit<LocationDetailState> {
  final LocationRepository _repository;

  LocationDetailCubit(this._repository)
    : super(const LocationDetailState.loading());

  Future<void> load(int id) async {
    final result = await _repository.getLocation(id);

    result.when(
      success: (data) => emit(LocationDetailState.success(data)),
      error: (failure) => emit(LocationDetailState.error(failure)),
    );
  }
}
