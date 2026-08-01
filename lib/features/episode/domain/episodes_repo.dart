import 'package:rick_and_morty/core/result/result.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/features/episode/domain/episode.dart';

abstract class EpisodeRepository {
  Future<Result<List<Episode>, AppFailure>> getEpisodesByIds(List<String> urls);
}
