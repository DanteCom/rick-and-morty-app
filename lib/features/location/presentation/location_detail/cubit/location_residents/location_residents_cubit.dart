import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/result/result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/features/character/domain/character_repository.dart';
import 'package:rick_and_morty/features/character/domain/entities/character.dart';

part 'location_residents_state.dart';
part 'location_residents_cubit.freezed.dart';

@injectable
class LocationResidentsCubit extends Cubit<LocationResidentsState> {
  final CharacterRepository _repository;
  LocationResidentsCubit(this._repository)
    : super(const LocationResidentsState.loading());

  Future<void> load(List<String> residents) async {
    final result = await _repository.getCharactersByUrls(residents);

    result.when(
      success: (data) => emit(LocationResidentsState.success(data)),
      error: (failure) => emit(LocationResidentsState.error(failure)),
    );
  }
}
