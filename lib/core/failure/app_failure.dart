import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/core/failure/failure.dart';

part 'app_failure.freezed.dart';

@freezed
class AppFailure with _$AppFailure implements Failure {
  const factory AppFailure.noConnection() = _NoConnection;
  const factory AppFailure.requestLimit() = _RequestLimit;
  const factory AppFailure.notFound() = _NotFound;
  const factory AppFailure.unknown() = _Unknown;

  const AppFailure._();

}
