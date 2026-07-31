import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/core/failure/failure.dart';

part 'async_state.freezed.dart';

@freezed
class AsyncState<F extends Failure> with _$AsyncState<F> {
  const factory AsyncState.idle() = _Idle<F>;
  const factory AsyncState.loading() = _Loading<F>;
  const factory AsyncState.error(F failure) = _Error<F>;
}
