import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/result/result.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/core/extensions/dio_extension.dart';
import 'package:rick_and_morty/features/characters/data/models/models.dart';
import 'package:rick_and_morty/features/characters/domain/characters_repo.dart';
import 'package:rick_and_morty/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty/features/characters/domain/entities/character_response.dart';

@LazySingleton(as: CharactersRepo)
class CharactersRepoImpl implements CharactersRepo {
  final Dio _dio;
  const CharactersRepoImpl({required this._dio});

  @override
  Future<Result<CharacterResponse, AppFailure>> getInitialPage() async {
    try {
      final response = await _dio.get('character');
      final characterResponse = CharacterResponseModel.fromJson(
        response.data,
      ).toEntity();

      return Result.success(characterResponse);
    } on DioException catch (e) {
      return Result.error(e.toAppFailure());
    } catch (_) {
      return Result.error(AppFailure.unknown());
    }
  }

  @override
  Future<Result<CharacterResponse, AppFailure>> getNextPage(String url) async {
    try {
      final response = await _dio.get(url);

      final characterResponse = CharacterResponseModel.fromJson(
        response.data,
      ).toEntity();

      return Result.success(characterResponse);
    } on DioException catch (e) {
      return Result.error(e.toAppFailure());
    } catch (_) {
      return Result.error(AppFailure.unknown());
    }
  }

  @override
  Future<Result<CharacterResponse, AppFailure>> searchCharacter(
    String name,
  ) async {
    try {
      final response = await _dio.get(
        'character',
        queryParameters: {'name': name},
      );

      final characterResponse = CharacterResponseModel.fromJson(
        response.data,
      ).toEntity();

      return Result.success(characterResponse);
    } on DioException catch (e) {
      return Result.error(e.toAppFailure());
    } catch (_) {
      return Result.error(AppFailure.unknown());
    }
  }

  @override
  Future<Result<Character, AppFailure>> getCharacter(int id) async {
    try {
      final response = await _dio.get('character/$id');
      return Result.success(CharacterModel.fromJson(response.data).toEntity());
    } on DioException catch (e) {
      return Result.error(e.toAppFailure());
    } catch (_) {
      return Result.error(AppFailure.unknown());
    }
  }
}
