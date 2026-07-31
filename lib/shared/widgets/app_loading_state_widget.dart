import 'package:flutter/cupertino.dart';
import 'package:rick_and_morty/app/theme/app_color_scheme.dart';

class AppLoadingStateWidget extends StatelessWidget {
  const AppLoadingStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);
    return CupertinoActivityIndicator(color: color.textPrimary);
  }
}
