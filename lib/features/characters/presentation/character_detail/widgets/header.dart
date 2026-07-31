import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:rick_and_morty/app/theme/app_color_scheme.dart';
import 'package:rick_and_morty/app/theme/app_text_styles.dart';
import 'package:rick_and_morty/features/characters/domain/entities/character.dart';
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

  final double minHeroCardHeight = 256;

  double progressInRange(double start, double end) {
    return ((progress - start) / (end - start)).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);

    final textProgress = progressInRange(0.0, 0.1);

    final avatarProgress = progressInRange(0.15, 0.3);

    final bgImageProgress = progressInRange(0.0, 0.4);

    final titleTextProgress = progressInRange(0.3, 0.4);

    return SizedBox(
      height: lerpDouble(maxHeight, minHeight, bgImageProgress),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxHeight = constraints.maxHeight;
          final maxWidth = constraints.maxWidth;

          return Stack(
            children: [
              Container(
                constraints: BoxConstraints(maxHeight: maxHeight),
                child: Column(
                  children: [
                    Expanded(child: _BGPosterImage(character: character)),
                    SizedBox(
                      height: lerpDouble(
                        minHeroCardHeight / 1.5,
                        0.0,
                        textProgress,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.lerp(
                  Alignment.bottomCenter,
                  Alignment.topCenter,
                  bgImageProgress,
                )!,
                child: SizedBox(
                  height: lerpDouble(
                    minHeroCardHeight,
                    maxHeight,
                    avatarProgress,
                  ),
                  child: _HeroCard(
                    maxHeight: maxHeight,
                    maxWidth: maxWidth,
                    character: character,
                    textProgress: textProgress,
                    avatarProgress: avatarProgress,
                  ),
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
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard({
    required this.maxHeight,
    required this.maxWidth,
    required this.character,

    required this.avatarProgress,
    required this.textProgress,
  });

  final double maxHeight;
  final double maxWidth;
  final Character character;
  final double textProgress;
  final double avatarProgress;

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);

    final avatarBorder = BorderRadius.lerp(
      BorderRadius.circular(100),
      BorderRadius.zero,
      avatarProgress,
    )!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: lerpDouble(176, maxHeight, avatarProgress)!,
          width: lerpDouble(176, maxWidth, avatarProgress)!,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: avatarBorder,
            color: color.onSurface,
          ),
          child: Opacity(
            opacity: 1 - avatarProgress,
            child: ClipRRect(
              borderRadius: avatarBorder,
              child: AppImage.network(character.image),
            ),
          ),
        ),
        SizedBox(height: lerpDouble(10, 0, avatarProgress)),
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
