import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:rick_and_morty/app/theme/app_color_scheme.dart';
import 'package:rick_and_morty/app/theme/app_text_styles.dart';
import 'package:rick_and_morty/features/location/domain/entities/location.dart';

class LocationDetailPageHeader extends StatelessWidget {
  final double progress;
  final Location location;
  const LocationDetailPageHeader(
    this.location, {
    super.key,
    required this.progress,
  });

  double _progressInRange(double start, double end) {
    return ((progress - start) / (end - start)).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);
    final padding = MediaQuery.paddingOf(context);

    final borderProgress = _progressInRange(0.8, 1.0);

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxHeight = constraints.maxHeight;

        return Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: lerpDouble(26, maxHeight, borderProgress)!,
              child: Container(
                padding: EdgeInsets.only(top: padding.top),
                decoration: BoxDecoration(
                  color: Color.lerp(
                    color.background,
                    color.onSurface,
                    borderProgress,
                  ),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.lerp(
                      Radius.circular(30),
                      Radius.zero,
                      borderProgress,
                    )!,
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: padding.top),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => context.pop(),
                      child: Center(
                        child: Icon(
                          CupertinoIcons.arrow_left,
                          color: color.textPrimary,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Opacity(
                      opacity: borderProgress,
                      child: Text(
                        location.name,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.s34w400(color.textPrimary),
                      ),
                    ),
                  ),
                  SizedBox(width: 50),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
