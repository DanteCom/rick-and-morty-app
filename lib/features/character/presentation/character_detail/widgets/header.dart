import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:rick_and_morty/app/theme/app_color_scheme.dart';
import 'package:rick_and_morty/app/theme/app_text_styles.dart';
import 'package:rick_and_morty/features/character/domain/entities/character.dart';
import 'package:rick_and_morty/shared/widgets/app_image.dart';

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

  final double _minHeroCardHeight = 256;

  double _progressInRange(double start, double end) {
    return ((progress - start) / (end - start)).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);

    final titleTextProgress = _progressInRange(0.3, 1.0);
    final bgImageProgress = _progressInRange(0.0, 0.3);

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxHeight = constraints.maxHeight;
        final maxWidth = constraints.maxWidth;

        return Stack(
          children: [
            Column(
              children: [
                Expanded(child: _BGPosterImage(character: character)),
                SizedBox(
                  height: lerpDouble(
                    _minHeroCardHeight / 1.5,
                    0.0,
                    bgImageProgress,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.lerp(
                Alignment.bottomCenter,
                Alignment.center,
                bgImageProgress,
              )!,
              child: _HeroCard(
                maxWidth: maxWidth,
                maxHeight: maxHeight,
                minHeight: _minHeroCardHeight,
                character: character,
                progress: progress,
              ),
            ),
            Positioned(
              left: 24,
              right: 24,
              child: SafeArea(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CupertinoButton(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        onPressed: () => context.pop(),
                        child: Icon(
                          CupertinoIcons.arrow_left,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: titleTextProgress,
                      child: Text(
                        character.name,
                        style: AppTextStyles.s34w400(color.textPrimary),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard({
    required this.maxHeight,
    required this.minHeight,
    required this.maxWidth,
    required this.character,
    required this.progress,
  });

  final Character character;
  final double maxHeight;
  final double minHeight;
  final double maxWidth;
  final double progress;

  double _progressInRange(double start, double end) {
    return ((progress - start) / (end - start)).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);

    final border = BorderRadius.lerp(
      BorderRadius.circular(100),
      BorderRadius.zero,
      progress,
    )!;

    final opacity = _progressInRange(0.0, 0.8);
    final textProgress = _progressInRange(0.0, 0.2);

    return SizedBox(
      height: lerpDouble(minHeight, maxHeight, progress),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: lerpDouble(176, maxWidth, opacity),
            height: lerpDouble(176, maxHeight, opacity),
            padding: EdgeInsets.all(8),
            constraints: BoxConstraints.tightFor(),
            decoration: BoxDecoration(
              borderRadius: border,
              color: color.onSurface,
            ),
            child: Opacity(
              opacity: 1 - opacity,
              child: ClipRRect(
                borderRadius: border,
                child: AppImage.network(character.image),
              ),
            ),
          ),
          SizedBox(height: lerpDouble(10, 0, textProgress)),
          Align(
            heightFactor: 1 - textProgress,
            child: Opacity(
              opacity: 1 - textProgress,
              child: Column(
                children: [
                  Text(
                    character.name,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.s34w400(color.textPrimary),
                  ),
                  Text(
                    character.status.name.toUpperCase(),
                    style: AppTextStyles.s15w500(Color(0xFF43D049)),
                  ),
                ],
              ),
            ),
          ),
        ],
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
                ? LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [.0, .37, .69],
                    colors: [
                      Color(0xFF000000),
                      Color(0x000B1E2D),
                      Color(0x000B1E2D),
                    ],
                  )
                : LinearGradient(
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
