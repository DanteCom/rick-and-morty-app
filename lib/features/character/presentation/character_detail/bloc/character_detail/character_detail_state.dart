part of 'character_detail_bloc.dart';

@freezed
sealed class CharacterDetailState with _$CharacterDetailState {
  const factory CharacterDetailState.initial() = _Initial;
  const factory CharacterDetailState.loading() = _Loading;
  const factory CharacterDetailState.success(Character character) = _Success;
  const factory CharacterDetailState.error(AppFailure failure) = _Error;
}
