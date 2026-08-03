// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:rick_and_morty/app/router/app_router.dart' as _i622;
import 'package:rick_and_morty/core/di/register_module.dart' as _i304;
import 'package:rick_and_morty/features/character/data/character_repository.dart'
    as _i767;
import 'package:rick_and_morty/features/character/domain/character_repository.dart'
    as _i302;
import 'package:rick_and_morty/features/character/presentation/character_detail/bloc/character_detail/character_detail_bloc.dart'
    as _i964;
import 'package:rick_and_morty/features/character/presentation/character_detail/bloc/character_episodes/character_episodes_bloc.dart'
    as _i551;
import 'package:rick_and_morty/features/character/presentation/characters/bloc/characters/characters_bloc.dart'
    as _i744;
import 'package:rick_and_morty/features/character/presentation/characters/bloc/characters_search/characters_search_bloc.dart'
    as _i365;
import 'package:rick_and_morty/features/episode/data/episode_repository.dart'
    as _i530;
import 'package:rick_and_morty/features/episode/domain/episodes_repo.dart'
    as _i820;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.singleton<_i622.AppRouter>(() => _i622.AppRouter());
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio());
    gh.lazySingleton<_i820.EpisodeRepository>(
      () => _i530.EpisodeRepoImpl(dio: gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i302.CharacterRepository>(
      () => _i767.CharacterRepositoryImpl(dio: gh<_i361.Dio>()),
    );
    gh.factory<_i964.CharacterDetailBloc>(
      () => _i964.CharacterDetailBloc(gh<_i302.CharacterRepository>()),
    );
    gh.factory<_i744.CharactersBloc>(
      () => _i744.CharactersBloc(gh<_i302.CharacterRepository>()),
    );
    gh.factory<_i365.CharactersSearchBloc>(
      () => _i365.CharactersSearchBloc(gh<_i302.CharacterRepository>()),
    );
    gh.factory<_i551.CharacterEpisodesBloc>(
      () => _i551.CharacterEpisodesBloc(gh<_i820.EpisodeRepository>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i304.RegisterModule {}
