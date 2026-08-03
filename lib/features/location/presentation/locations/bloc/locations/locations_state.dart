part of 'locations_bloc.dart';

@freezed
class LocationsState with _$LocationsState {
  const factory LocationsState.initial() = _Initial;
  const factory LocationsState.loading() = _Loading;
  const factory LocationsState.success({
    required LocationResponse response,
    @Default(AsyncState.idle()) AsyncState<AppFailure> loadMoreState,
  }) = _Success;
  const factory LocationsState.error(AppFailure failure) = _Error;

  const LocationsState._();

  bool get canLoadMore => maybeWhen(
    success: (response, loadMoreState) =>
        loadMoreState.maybeWhen(loading: () => false, orElse: () => true),
    orElse: () => true,
  );
}
