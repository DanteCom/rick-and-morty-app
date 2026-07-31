import 'package:rick_and_morty/features/characters/domain/entities/character.dart';

class CharacterResponse {
  final CharacterPageInfo info;
  final List<Character> characters;

  const CharacterResponse({required this.info, required this.characters});

  CharacterResponse copyWith({
    CharacterPageInfo? info,
    List<Character>? characters,
  }) {
    return CharacterResponse(
      info: info ?? this.info,
      characters: characters ?? this.characters,
    );
  }
}

class CharacterPageInfo {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  const CharacterPageInfo({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });
}
