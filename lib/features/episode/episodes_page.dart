import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/app/theme/app_color_scheme.dart';
import 'package:rick_and_morty/app/theme/app_text_styles.dart';

@RoutePage()
class EpisodesPage extends StatelessWidget {
  const EpisodesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);
    
    return Scaffold(
      body: Center(
        child: Text(
          'Episodes Page',
          style: AppTextStyles.s38w500(color.textPrimary),
        ),
      ),
    );
  }
}
