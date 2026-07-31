import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rick_and_morty/app/theme/app_color_scheme.dart';
import 'package:rick_and_morty/shared/widgets/app_loading_state_widget.dart';

class AppImage extends StatelessWidget {
  const AppImage.network(
    this.url, {
    super.key,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
  });

  final String url;
  final BoxFit fit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);

    final image =  CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      width: width,
      height: height,
      placeholder: (_, _) => Container(
        color: color.textSecondary,
        child: const AppLoadingStateWidget(),
      ),
      errorWidget: (_, _, _) => Container(
        color: color.textSecondary,
        child: Icon(Icons.error, color: color.surface),
      ),
    );

    return image;
  }
}
