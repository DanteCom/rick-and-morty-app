import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:rick_and_morty/core/extensions/double_extension.dart';
import 'package:rick_and_morty/shared/widgets/app_image.dart';
import 'package:rick_and_morty/app/theme/app_text_styles.dart';
import 'package:rick_and_morty/app/theme/app_color_scheme.dart';
import 'package:rick_and_morty/features/character/domain/entities/character.dart';

class CharacterDetailPageHeader extends StatelessWidget {
  final Character character;
  final double maxHeight;
  final double minHeight;
  final double progress;
  const CharacterDetailPageHeader(
    this.character, {
    super.key,
    required this.maxHeight,
    required this.minHeight,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);

    final size = MediaQuery.sizeOf(context);
    final padding = MediaQuery.paddingOf(context);

    final bgImageProgress = progress.range(0.0, 0.3);
    final titleTextProgress = progress.range(0.7, 1.0);

    const double minAvatarSize = 176.0;
    final currentHeight = progress.lerp(maxHeight, minHeight);

    return Stack(
      children: [
        Column(
          children: [
            Expanded(child: _BGPosterImage(character: character)),
            SizedBox(height: bgImageProgress.lerp(minAvatarSize / 2, 0.0)),
          ],
        ),
        Align(
          alignment: Alignment.lerp(
            Alignment.bottomCenter,
            Alignment.center,
            bgImageProgress,
          )!,
          child: _Avatar(
            character,
            progress: progress,
            height: progress.lerp(minAvatarSize, currentHeight),
            width: progress.lerp(minAvatarSize, size.width),
          ),
        ),
        Positioned.fill(
          top: padding.top,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => context.pop(),
                  child: Icon(
                    CupertinoIcons.arrow_left,
                    color: color.textPrimary,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    character.name,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.s34w400(
                      color.textPrimary.withValues(alpha: titleTextProgress),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 50),
            ],
          ),
        ),
      ],
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar(
    this.character, {
    required this.width,
    required this.height,
    required this.progress,
  });

  final Character character;

  final double height;
  final double width;
  final double progress;

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);

    final border = BorderRadius.lerp(
      BorderRadius.circular(100),
      BorderRadius.zero,
      progress,
    )!;

    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: border,
        color: Color.lerp(color.background, color.onSurface, progress),
      ),
      child: Opacity(
        opacity: 1 - progress,
        child: ClipRRect(
          borderRadius: border,
          child: AppImage.network(character.image),
        ),
      ),
    );
  }
}

class _BGPosterImage extends StatelessWidget {
  const _BGPosterImage({required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);

    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: color.brightness == Brightness.dark
                ? const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [.0, .37, .69],
                    colors: [
                      Color(0xFF000000),
                      Color(0x000B1E2D),
                      Color(0x000B1E2D),
                    ],
                  )
                : const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [.30, .50, .70],
                    colors: [
                      Color(0x50000000),
                      Color(0x390B1E2D),
                      Color(0x000B1E2D),
                    ],
                  ),
          ),
        ),
        ClipRect(
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
            child: AppImage.network(character.image, fit: BoxFit.cover),
          ),
        ),
      ],
    );
  }
}
