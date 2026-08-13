import 'package:rick_and_morty/features/episode/domain/entities/episode.dart';

class EpisodeResponse {
  final List<Episode> episodes;
  final EpisodePageInfo info;

  const EpisodeResponse({required this.episodes, required this.info});

  EpisodeResponse copyWith({List<Episode>? episodes, EpisodePageInfo? info}) {
    return EpisodeResponse(
      episodes: episodes ?? this.episodes,
      info: info ?? this.info,
    );
  }
}

class EpisodePageInfo {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  const EpisodePageInfo({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });
}
