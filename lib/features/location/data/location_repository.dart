import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/extensions/dio_extension.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/core/result/result.dart';
import 'package:rick_and_morty/features/location/data/models/location.dart';
import 'package:rick_and_morty/features/location/data/models/location_response.dart';
import 'package:rick_and_morty/features/location/domain/entities/location.dart';
import 'package:rick_and_morty/features/location/domain/entities/location_response.dart';
import 'package:rick_and_morty/features/location/domain/location_repository.dart';

@LazySingleton(as: LocationRepository)
class LocationRepositoryImpl implements LocationRepository {
  final Dio _dio;
  LocationRepositoryImpl({required this._dio});

  @override
  Future<Result<LocationResponse, AppFailure>> getInitialPage() async {
    try {
      final response = await _dio.get('location');
      final location = LocationResponseModel.fromJson(response.data);

      return Result.success(location.toEntity());
    } on DioException catch (e) {
      return Result.error(e.toAppFailure());
    } catch (_) {
      return const Result.error(AppFailure.unknown());
    }
  }

  @override
  Future<Result<LocationResponse, AppFailure>> getNextPage(String url) async {
    try {
      final response = await _dio.get('location');
      final location = LocationResponseModel.fromJson(response.data);

      return Result.success(location.toEntity());
    } on DioException catch (e) {
      return Result.error(e.toAppFailure());
    } catch (_) {
      return const Result.error(AppFailure.unknown());
    }
  }

  @override
  Future<Result<LocationResponse, AppFailure>> searchLocation(
    String name,
  ) async {
    try {
      final response = await _dio.get(
        'location',
        queryParameters: {'name': name},
      );
      final location = LocationResponseModel.fromJson(response.data);

      return Result.success(location.toEntity());
    } on DioException catch (e) {
      return Result.error(e.toAppFailure());
    } catch (_) {
      return const Result.error(AppFailure.unknown());
    }
  }

  @override
  Future<Result<Location, AppFailure>> getLocation(int id) async {
    try {
      final response = await _dio.get('location/$id');
      final location = LocationModel.fromJson(response.data);

      return Result.success(location.toEntity());
    } on DioException catch (e) {
      return Result.error(e.toAppFailure());
    } catch (_) {
      return const Result.error(AppFailure.unknown());
    }
  }
}
