import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/core/result/result.dart';
import 'package:rick_and_morty/features/character/domain/entities/character.dart';
import 'package:rick_and_morty/features/character/domain/entities/character_response.dart';

abstract interface class CharacterRepository {
  Future<Result<CharacterResponse, AppFailure>> getInitialPage();
  Future<Result<CharacterResponse, AppFailure>> getNextPage(String url);
  Future<Result<List<Character>, AppFailure>> getCharactersByUrls(
    List<String> urls,
  );

  Future<Result<Character, AppFailure>> getCharacter(int id);
  Future<Result<CharacterResponse, AppFailure>> searchCharacters(String name);
}
