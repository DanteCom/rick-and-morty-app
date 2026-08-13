import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:rick_and_morty/app/theme/app_color_scheme.dart';
import 'package:rick_and_morty/app/theme/app_text_styles.dart';
import 'package:rick_and_morty/core/extensions/double_extension.dart';
import 'package:rick_and_morty/features/location/domain/entities/location.dart';
import 'package:rick_and_morty/shared/resources/resources.dart';
import 'package:rick_and_morty/shared/widgets/app_svg_picture.dart';

class LocationDetailPageHeader extends StatelessWidget {
  final double progress;
  final Location location;
  const LocationDetailPageHeader(
    this.location, {
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);
    final padding = MediaQuery.paddingOf(context);

    final opacity = progress.range(.0, .8);
    final borderProgress = progress.range(.6, .8);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          color: color.onSurface.withValues(alpha: opacity),
          padding: EdgeInsets.only(top: padding.top),
          child: Row(
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => context.pop(),
                  child: AppSvgPicture.asset(
                    Svgs.arrowLeft,
                    color: color.textPrimary,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  location.name,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.s34w400(
                    color.textPrimary.withValues(alpha: opacity),
                  ),
                ),
              ),
              const SizedBox(width: 50),
            ],
          ),
        ),
        Flexible(
          child: Container(
            height: 30,
            decoration: BoxDecoration(
              color: color.background,
              borderRadius: BorderRadius.vertical(
                top: Radius.lerp(
                  const Radius.circular(30),
                  Radius.zero,
                  borderProgress,
                )!,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
