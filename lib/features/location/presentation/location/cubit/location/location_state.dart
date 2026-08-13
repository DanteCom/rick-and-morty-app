part of 'location_cubit.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState.loading() = _Loading;
  const factory LocationState.success({
    required LocationResponse response,
    @Default(AsyncState.idle()) AsyncState<AppFailure> loadMoreState,
  }) = _Success;
  const factory LocationState.error(AppFailure failure) = _Error;

  const LocationState._();

  bool get canLoadMore => maybeWhen(
    success: (response, loadMoreState) => response.info.next != null
        ? loadMoreState.maybeWhen(loading: () => false, orElse: () => true)
        : false,
    orElse: () => false,
  );
}
