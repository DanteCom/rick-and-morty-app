import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/core/result/result.dart';
import 'package:rick_and_morty/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty/features/characters/domain/entities/character_response.dart';

abstract interface class CharactersRepo {
  Future<Result<CharacterResponse, AppFailure>> getInitialPage();
  Future<Result<CharacterResponse, AppFailure>> getNextPage(String url);

  Future<Result<CharacterResponse, AppFailure>> searchCharacter(String name);

  Future<Result<Character, AppFailure>> getCharacter(int id);
}
