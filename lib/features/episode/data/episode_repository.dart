import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/result/result.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/core/extensions/dio_extension.dart';
import 'package:rick_and_morty/features/episode/data/models/episode.dart';
import 'package:rick_and_morty/features/episode/data/models/episode_response.dart';
import 'package:rick_and_morty/features/episode/domain/entities/episode.dart';
import 'package:rick_and_morty/features/episode/domain/entities/episode_response.dart';
import 'package:rick_and_morty/features/episode/domain/episode_repository.dart';

@LazySingleton(as: EpisodeRepository)
class EpisodesRepositoryImpl implements EpisodeRepository {
  final Dio _dio;
  const EpisodesRepositoryImpl({required this._dio});

  @override
  Future<Result<EpisodeResponse, AppFailure>> getInitialPage() async {
    try {
      final response = await _dio.get('episode');
      final episodeResponse = EpisodeResponseModel.fromJson(response.data);

      return Result.success(episodeResponse.toEntity());
    } on DioException catch (e) {
      return Result.error(e.toAppFailure());
    } catch (_) {
      return const Result.error(AppFailure.unknown());
    }
  }

  @override
  Future<Result<EpisodeResponse, AppFailure>> getNextPage(String url) async {
    try {
      final response = await _dio.get(url);
      final episodeResponse = EpisodeResponseModel.fromJson(response.data);

      return Result.success(episodeResponse.toEntity());
    } on DioException catch (e) {
      return Result.error(e.toAppFailure());
    } catch (_) {
      return const Result.error(AppFailure.unknown());
    }
  }

  @override
  Future<Result<Episode, AppFailure>> getEpisode(int id) async {
    try {
      final response = await _dio.get('episode/$id');
      final episode = EpisodeModel.fromJson(response.data);

      return Result.success(episode.toEntity());
    } on DioException catch (e) {
      return Result.error(e.toAppFailure());
    } catch (_) {
      return const Result.error(AppFailure.unknown());
    }
  }

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
      return const Result.error(AppFailure.unknown());
    }
  }

  @override
  Future<Result<EpisodeResponse, AppFailure>> searchEpisodes(
    String name,
  ) async {
    try {
      final response = await _dio.get(
        'episode',
        queryParameters: {'name': name},
      );

      final episodeResponse = EpisodeResponseModel.fromJson(response.data);

      return Result.success(episodeResponse.toEntity());
    } on DioException catch (e) {
      return Result.error(e.toAppFailure());
    } catch (_) {
      return const Result.error(AppFailure.unknown());
    }
  }
}
