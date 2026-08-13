import 'package:rick_and_morty/core/result/result.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/features/episode/domain/entities/episode.dart';
import 'package:rick_and_morty/features/episode/domain/entities/episode_response.dart';

abstract class EpisodeRepository {
  Future<Result<EpisodeResponse, AppFailure>> getInitialPage();

  Future<Result<EpisodeResponse, AppFailure>> getNextPage(String url);

  Future<Result<Episode, AppFailure>> getEpisode(int id);

  Future<Result<List<Episode>, AppFailure>> getEpisodesByUrls(
    List<String> urls,
  );

  Future<Result<EpisodeResponse, AppFailure>> searchEpisodes(String name);
}
