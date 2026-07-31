import 'package:flutter/material.dart';
import 'package:rick_and_morty/app/theme/app_color_scheme.dart';
import 'package:rick_and_morty/app/theme/app_text_styles.dart';
import 'package:rick_and_morty/shared/resources/resources.dart';

class AppErrorStateWidget extends StatelessWidget {
  final String title;
  const AppErrorStateWidget({
    super.key,
    this.title = 'Упс! Что-то пошло не так',
  });

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(Images.error),
        SizedBox(height: 20),
        Text(
          title ,
          style: AppTextStyles.s22w500(color.textSecondary),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
