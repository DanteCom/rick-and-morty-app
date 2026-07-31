import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/core/failure/failure.dart';

part 'result.freezed.dart';

@freezed
class Result<T, F extends Failure> with _$Result<T, F> {
  const factory Result.success(T data) = _Success<T, F>;
  const factory Result.error(F failure) = _Error<T, F>;
}

class Unit {
  const Unit._();
}

const unit = Unit._();
