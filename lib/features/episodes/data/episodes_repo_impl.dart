import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/result/result.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/core/extensions/dio_extension.dart';
import 'package:rick_and_morty/features/episodes/data/models/models.dart';
import 'package:rick_and_morty/features/episodes/domain/episode.dart';
import 'package:rick_and_morty/features/episodes/domain/episodes_repo.dart';

@LazySingleton(as: EpisodesRepo)
class EpisodesRepoImpl implements EpisodesRepo {
  final Dio _dio;
  const EpisodesRepoImpl({required this._dio});

  @override
  Future<Result<List<Episode>, AppFailure>> getEpisodesByIds(
    List<String> urls,
  ) async {
    try {
      final ids = urls.map((e) => e.split('/').last).join(',');

      final response = await _dio.get('/location/$ids');
      final data = response.data as List;

      final episodes = data
          .map((e) => EpisodeModel.fromJson(e).toEntitiy())
          .toList();

      return Result.success(episodes);
    } on DioException catch (e) {
      return Result.error(e.toAppFailure());
    } catch (_) {
      return Result.error(AppFailure.unknown());
    }
  }
}
