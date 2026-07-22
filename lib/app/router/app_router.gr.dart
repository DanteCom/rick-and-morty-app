// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:rick_and_morty/app/app_shell_page.dart' as _i1;
import 'package:rick_and_morty/features/characters/characters_page.dart'
    as _i2;
import 'package:rick_and_morty/features/episodes/episodes_page.dart' as _i3;
import 'package:rick_and_morty/features/locations/locations_page.dart'
    as _i4;

/// generated route for
/// [_i1.AppShellPage]
class AppShellRoute extends _i5.PageRouteInfo<void> {
  const AppShellRoute({List<_i5.PageRouteInfo>? children})
    : super(AppShellRoute.name, initialChildren: children);

  static const String name = 'AppShellRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.AppShellPage();
    },
  );
}

/// generated route for
/// [_i2.CharactersPage]
class CharactersRoute extends _i5.PageRouteInfo<void> {
  const CharactersRoute({List<_i5.PageRouteInfo>? children})
    : super(CharactersRoute.name, initialChildren: children);

  static const String name = 'CharactersRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.CharactersPage();
    },
  );
}

/// generated route for
/// [_i3.EpisodesPage]
class EpisodesRoute extends _i5.PageRouteInfo<void> {
  const EpisodesRoute({List<_i5.PageRouteInfo>? children})
    : super(EpisodesRoute.name, initialChildren: children);

  static const String name = 'EpisodesRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.EpisodesPage();
    },
  );
}

/// generated route for
/// [_i4.LocationsPage]
class LocationsRoute extends _i5.PageRouteInfo<void> {
  const LocationsRoute({List<_i5.PageRouteInfo>? children})
    : super(LocationsRoute.name, initialChildren: children);

  static const String name = 'LocationsRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.LocationsPage();
    },
  );
}
