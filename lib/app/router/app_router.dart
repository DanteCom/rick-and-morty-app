import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/app/router/app_router.gr.dart';

@singleton
@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      initial: true,
      page: AppShellRoute.page,
      children: [
        AutoRoute(page: CharactersRoute.page),
        AutoRoute(page: LocationsRoute.page),
        AutoRoute(page: EpisodesRoute.page),
      ],
    ),
    AutoRoute(page: CharacterDetailRoute.page),
    AutoRoute(page: LocationDetailRoute.page),
  ];
}
