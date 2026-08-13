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
import 'package:rick_and_morty/features/character/presentation/character/cubit/character/character_cubit.dart'
    as _i643;
import 'package:rick_and_morty/features/character/presentation/character/cubit/character_search/character_search_cubit.dart'
    as _i250;
import 'package:rick_and_morty/features/character/presentation/character_detail/cubit/character_detail/character_detail_cubit.dart'
    as _i252;
import 'package:rick_and_morty/features/character/presentation/character_detail/cubit/character_episodes/character_episodes_cubit.dart'
    as _i413;
import 'package:rick_and_morty/features/episode/data/episode_repository.dart'
    as _i530;
import 'package:rick_and_morty/features/episode/domain/episode_repository.dart'
    as _i388;
import 'package:rick_and_morty/features/episode/presentation/episode/cubit/episode/episode_cubit.dart'
    as _i572;
import 'package:rick_and_morty/features/episode/presentation/episode/cubit/episode_search/episode_search_cubit.dart'
    as _i209;
import 'package:rick_and_morty/features/episode/presentation/episode_detail/cubit/episode_character_cubit.dart'
    as _i1020;
import 'package:rick_and_morty/features/episode/presentation/episode_detail/cubit/episode_detail_cubit.dart'
    as _i499;
import 'package:rick_and_morty/features/location/data/location_repository.dart'
    as _i930;
import 'package:rick_and_morty/features/location/domain/location_repository.dart'
    as _i33;
import 'package:rick_and_morty/features/location/presentation/location/cubit/location/location_cubit.dart'
    as _i981;
import 'package:rick_and_morty/features/location/presentation/location/cubit/location_search/location_search_cubit.dart'
    as _i102;
import 'package:rick_and_morty/features/location/presentation/location_detail/cubit/location_detail/location_detail_cubit.dart'
    as _i403;
import 'package:rick_and_morty/features/location/presentation/location_detail/cubit/location_residents/location_residents_cubit.dart'
    as _i974;

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
    gh.lazySingleton<_i388.EpisodeRepository>(
      () => _i530.EpisodesRepositoryImpl(dio: gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i33.LocationRepository>(
      () => _i930.LocationRepositoryImpl(dio: gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i302.CharacterRepository>(
      () => _i767.CharacterRepositoryImpl(dio: gh<_i361.Dio>()),
    );
    gh.factory<_i643.CharacterCubit>(
      () => _i643.CharacterCubit(gh<_i302.CharacterRepository>()),
    );
    gh.factory<_i250.CharacterSearchCubit>(
      () => _i250.CharacterSearchCubit(gh<_i302.CharacterRepository>()),
    );
    gh.factory<_i252.CharacterDetailCubit>(
      () => _i252.CharacterDetailCubit(gh<_i302.CharacterRepository>()),
    );
    gh.factory<_i572.EpisodeCubit>(
      () => _i572.EpisodeCubit(gh<_i388.EpisodeRepository>()),
    );
    gh.factory<_i209.EpisodeSearchCubit>(
      () => _i209.EpisodeSearchCubit(gh<_i388.EpisodeRepository>()),
    );
    gh.factory<_i499.EpisodeDetailCubit>(
      () => _i499.EpisodeDetailCubit(gh<_i388.EpisodeRepository>()),
    );
    gh.factory<_i981.LocationCubit>(
      () => _i981.LocationCubit(gh<_i33.LocationRepository>()),
    );
    gh.factory<_i102.LocationSearchCubit>(
      () => _i102.LocationSearchCubit(gh<_i33.LocationRepository>()),
    );
    gh.factory<_i403.LocationDetailCubit>(
      () => _i403.LocationDetailCubit(gh<_i33.LocationRepository>()),
    );
    gh.factory<_i1020.EpisodeCharacterCubit>(
      () => _i1020.EpisodeCharacterCubit(gh<_i302.CharacterRepository>()),
    );
    gh.factory<_i974.LocationResidentsCubit>(
      () => _i974.LocationResidentsCubit(gh<_i302.CharacterRepository>()),
    );
    gh.factory<_i413.CharacterEpisodesCubit>(
      () => _i413.CharacterEpisodesCubit(gh<_i388.EpisodeRepository>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i304.RegisterModule {}
