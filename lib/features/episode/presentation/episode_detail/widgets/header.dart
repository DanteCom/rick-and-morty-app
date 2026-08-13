import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/app/theme/app_color_scheme.dart';
import 'package:rick_and_morty/app/theme/app_text_styles.dart';
import 'package:rick_and_morty/core/extensions/double_extension.dart';
import 'package:rick_and_morty/shared/resources/resources.dart';
import 'package:rick_and_morty/shared/widgets/app_svg_picture.dart';

class EpisodeDetailPageHeader extends StatelessWidget {
  final double progress;
  final double minHeight;

  const EpisodeDetailPageHeader({
    super.key,
    required this.minHeight,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);
    final padding = MediaQuery.paddingOf(context);

    final playBtnProgress = progress.range(.4, .5);
    final headerProgress = progress.range(.5, .65);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.only(top: padding.top),
          decoration: BoxDecoration(
            color: color.onSurface.withValues(alpha: headerProgress),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: AppSvgPicture.asset(
                    Svgs.arrowLeft,
                    color: color.textPrimary,
                  ),
                  onPressed: () => context.pop(),
                ),
              ),
              Expanded(
                child: Text(
                  'Рик Cанчез',
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.s34w400(
                    color.textPrimary.withValues(alpha: headerProgress),
                  ),
                ),
              ),
              const SizedBox(width: 50),
            ],
          ),
        ),

        Flexible(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: color.background,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(playBtnProgress.lerp(26, 0)),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  heightFactor: 1 - playBtnProgress,
                  widthFactor: 1 - playBtnProgress,
                  child: Container(
                    width: 100,
                    height: 100,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(
                        0xFF22A2BD,
                      ).withValues(alpha: 1 - playBtnProgress),
                      shape: BoxShape.circle,
                    ),
                    child: FittedBox(
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white.withValues(
                          alpha: 1 - playBtnProgress,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
