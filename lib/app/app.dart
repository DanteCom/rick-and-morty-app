import 'package:flutter/material.dart';
import 'package:rick_and_morty/app/router/app_router.dart';
import 'package:rick_and_morty/app/theme/app_color_scheme.dart';
import 'package:rick_and_morty/core/di/injectable.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: getIt<AppRouter>().config(),
      theme: ThemeData(scaffoldBackgroundColor: color.background),
    );
  }
}
