import 'package:dio/dio.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';

extension DioExceptionExtension on DioException {
  AppFailure toAppFailure() {
    final statusCode = response?.statusCode;

    if (statusCode == 404) return AppFailure.notFound();
    if (statusCode == 429) return AppFailure.requestLimit();

    return switch (type) {
      DioExceptionType.connectionError => AppFailure.noConnection(),
      _ => AppFailure.unknown(),
    };
  }
}
