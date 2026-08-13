import 'package:flutter/material.dart';
import 'package:rick_and_morty/app/theme/app_color_scheme.dart';
import 'package:rick_and_morty/app/theme/app_text_styles.dart';
import 'package:rick_and_morty/shared/resources/resources.dart';
import 'package:rick_and_morty/shared/widgets/app_svg_picture.dart';

class AppSearchField extends StatelessWidget {
  const AppSearchField({
    super.key,
    this.focusNode,
    this.onChanged,
    required this.hintText,
  });

  final String hintText;

  final FocusNode? focusNode;

  final void Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: color.onSurface,
        borderRadius: BorderRadius.circular(40),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      child: IntrinsicHeight(
        child: Row(
          children: [
            AppSvgPicture.asset(Svgs.search, color: color.textSecondary),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  focusNode: focusNode,
                  onChanged: onChanged,
                  cursorColor: color.primary,
                  onTapOutside: (event) {
                    if (focusNode != null && focusNode!.hasFocus) {
                      focusNode!.unfocus();
                    }
                  },
                  style: AppTextStyles.s16w500(color.textPrimary),
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: hintText,
                    hintStyle: AppTextStyles.s16w500(color.textSecondary),
                    contentPadding: EdgeInsets.zero,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            Container(width: 1.3, color: color.textSecondary),
            const SizedBox(width: 10),
            AppSvgPicture.asset(Svgs.filter, color: color.textSecondary),
          ],
        ),
      ),
    );
  }
}
