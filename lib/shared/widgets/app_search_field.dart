
import 'package:flutter/material.dart';
import 'package:rick_and_morty/app/theme/app_color_scheme.dart';
import 'package:rick_and_morty/app/theme/app_text_styles.dart';
import 'package:rick_and_morty/shared/resources/resources.dart';
import 'package:rick_and_morty/shared/widgets/app_svg_picture.dart';

class AppSearchField extends StatelessWidget {
  const AppSearchField({
    super.key,
    required this.controller,
    this.focusNode,
    required this.hintText,
  });

  final String hintText;

  final FocusNode? focusNode;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: color.onSurface,
        borderRadius: BorderRadius.circular(40),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      child: IntrinsicHeight(
        child: Row(
          children: [
            AppSvgPicture(Svgs.search, color: color.textSecondary),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  focusNode: focusNode,
                  controller: controller,
                  style: AppTextStyles.s16w500(color.textPrimary),
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: hintText,
                    hintStyle: AppTextStyles.s16w500(color.textSecondary),
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),
            Container(width: 1.3, color: color.textSecondary),
            SizedBox(width: 10),
            AppSvgPicture(Svgs.filter, color: color.textSecondary),
          ],
        ),
      ),
    );
  }
}
