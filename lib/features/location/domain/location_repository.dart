import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/core/result/result.dart';
import 'package:rick_and_morty/features/location/domain/entities/location.dart';
import 'package:rick_and_morty/features/location/domain/entities/location_response.dart';

abstract class LocationRepository {
  Future<Result<LocationResponse, AppFailure>> getInitialPage();
  Future<Result<LocationResponse, AppFailure>> getNextPage(String url);

  Future<Result<Location, AppFailure>> getLocation(int id);
  Future<Result<LocationResponse, AppFailure>> searchLocation(String name);
}
