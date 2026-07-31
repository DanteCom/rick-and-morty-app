enum CharacterStatus { alive, dead, unknown }

enum CharacterGender { female, male, genderless, unknown }

class Character {
  final int id;
  final String name;
  final CharacterStatus status;
  final String species;
  final String type;
  final CharacterGender gender;
  final CharacterOrigin origin;
  final CharacterOrigin location;
  final String image;
  final List<String> episodeUrls;
  final String url;
  final DateTime created;

  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episodeUrls,
    required this.url,
    required this.created,
  });
}

class CharacterOrigin {
  final String name;
  final String url;

  const CharacterOrigin({required this.name, required this.url});
}
