// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:rick_and_morty/app/app_shell_page.dart' as _i1;
import 'package:rick_and_morty/features/character/presentation/character/page/characters_page.dart'
    as _i3;
import 'package:rick_and_morty/features/character/presentation/character_detail/page/character_detail_page.dart'
    as _i2;
import 'package:rick_and_morty/features/episode/presentation/episode/page/episodes_page.dart'
    as _i5;
import 'package:rick_and_morty/features/episode/presentation/episode_detail/page/episode_detail_page.dart'
    as _i4;
import 'package:rick_and_morty/features/location/presentation/location/page/locations_page.dart'
    as _i7;
import 'package:rick_and_morty/features/location/presentation/location_detail/page/location_detail_page.dart'
    as _i6;

/// generated route for
/// [_i1.AppShellPage]
class AppShellRoute extends _i8.PageRouteInfo<void> {
  const AppShellRoute({List<_i8.PageRouteInfo>? children})
    : super(AppShellRoute.name, initialChildren: children);

  static const String name = 'AppShellRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.AppShellPage();
    },
  );
}

/// generated route for
/// [_i2.CharacterDetailPage]
class CharacterDetailRoute extends _i8.PageRouteInfo<CharacterDetailRouteArgs> {
  CharacterDetailRoute({
    required int id,
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
         CharacterDetailRoute.name,
         args: CharacterDetailRouteArgs(id: id, key: key),
         initialChildren: children,
       );

  static const String name = 'CharacterDetailRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CharacterDetailRouteArgs>();
      return _i8.WrappedRoute(
        child: _i2.CharacterDetailPage(args.id, key: args.key),
      );
    },
  );
}

class CharacterDetailRouteArgs {
  const CharacterDetailRouteArgs({required this.id, this.key});

  final int id;

  final _i9.Key? key;

  @override
  String toString() {
    return 'CharacterDetailRouteArgs{id: $id, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CharacterDetailRouteArgs) return false;
    return id == other.id && key == other.key;
  }

  @override
  int get hashCode => id.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i3.CharactersPage]
class CharactersRoute extends _i8.PageRouteInfo<void> {
  const CharactersRoute({List<_i8.PageRouteInfo>? children})
    : super(CharactersRoute.name, initialChildren: children);

  static const String name = 'CharactersRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return _i8.WrappedRoute(child: const _i3.CharactersPage());
    },
  );
}

/// generated route for
/// [_i4.EpisodeDetailPage]
class EpisodeDetailRoute extends _i8.PageRouteInfo<EpisodeDetailRouteArgs> {
  EpisodeDetailRoute({
    required int id,
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
         EpisodeDetailRoute.name,
         args: EpisodeDetailRouteArgs(id: id, key: key),
         initialChildren: children,
       );

  static const String name = 'EpisodeDetailRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EpisodeDetailRouteArgs>();
      return _i8.WrappedRoute(
        child: _i4.EpisodeDetailPage(args.id, key: args.key),
      );
    },
  );
}

class EpisodeDetailRouteArgs {
  const EpisodeDetailRouteArgs({required this.id, this.key});

  final int id;

  final _i9.Key? key;

  @override
  String toString() {
    return 'EpisodeDetailRouteArgs{id: $id, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EpisodeDetailRouteArgs) return false;
    return id == other.id && key == other.key;
  }

  @override
  int get hashCode => id.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i5.EpisodesPage]
class EpisodesRoute extends _i8.PageRouteInfo<void> {
  const EpisodesRoute({List<_i8.PageRouteInfo>? children})
    : super(EpisodesRoute.name, initialChildren: children);

  static const String name = 'EpisodesRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return _i8.WrappedRoute(child: const _i5.EpisodesPage());
    },
  );
}

/// generated route for
/// [_i6.LocationDetailPage]
class LocationDetailRoute extends _i8.PageRouteInfo<LocationDetailRouteArgs> {
  LocationDetailRoute({
    required int id,
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
         LocationDetailRoute.name,
         args: LocationDetailRouteArgs(id: id, key: key),
         initialChildren: children,
       );

  static const String name = 'LocationDetailRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LocationDetailRouteArgs>();
      return _i8.WrappedRoute(
        child: _i6.LocationDetailPage(args.id, key: args.key),
      );
    },
  );
}

class LocationDetailRouteArgs {
  const LocationDetailRouteArgs({required this.id, this.key});

  final int id;

  final _i9.Key? key;

  @override
  String toString() {
    return 'LocationDetailRouteArgs{id: $id, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LocationDetailRouteArgs) return false;
    return id == other.id && key == other.key;
  }

  @override
  int get hashCode => id.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i7.LocationsPage]
class LocationsRoute extends _i8.PageRouteInfo<void> {
  const LocationsRoute({List<_i8.PageRouteInfo>? children})
    : super(LocationsRoute.name, initialChildren: children);

  static const String name = 'LocationsRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return _i8.WrappedRoute(child: const _i7.LocationsPage());
    },
  );
}
