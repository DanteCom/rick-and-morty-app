import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/result/result.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/core/extensions/dio_extension.dart';
import 'package:rick_and_morty/features/episode/data/models/models.dart';
import 'package:rick_and_morty/features/episode/domain/episode.dart';
import 'package:rick_and_morty/features/episode/domain/episode_repository.dart';

@LazySingleton(as: EpisodeRepository)
class EpisodesRepositoryImpl implements EpisodeRepository {
  final Dio _dio;
  const EpisodesRepositoryImpl({required this._dio});

  @override
  Future<Result<List<Episode>, AppFailure>> getEpisodesByUrls(
    List<String> urls,
  ) async {
    try {
      final ids = urls.map((e) => e.split('/').last).join(',');

      final response = await _dio.get('/episode/$ids');
      final data = response.data;

      if (data is List) {
        final episodes = data
            .map((e) => EpisodeModel.fromJson(e).toEntity())
            .toList();
        return Result.success(episodes);
      } else {
        final episodes = [EpisodeModel.fromJson(data).toEntity()];
        return Result.success(episodes);
      }
    } on DioException catch (e) {
      return Result.error(e.toAppFailure());
    } catch (_) {
      return Result.error(AppFailure.unknown());
    }
  }
}
