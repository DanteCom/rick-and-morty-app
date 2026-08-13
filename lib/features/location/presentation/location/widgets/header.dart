import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/app/theme/app_text_styles.dart';
import 'package:rick_and_morty/app/theme/app_color_scheme.dart';
import 'package:rick_and_morty/core/extensions/double_extension.dart';
import 'package:rick_and_morty/shared/resources/resources.dart';
import 'package:rick_and_morty/shared/widgets/app_svg_picture.dart';
import 'package:rick_and_morty/shared/widgets/app_search_field.dart';
import 'package:rick_and_morty/features/location/presentation/location/cubit/location/location_cubit.dart';
import 'package:rick_and_morty/features/location/presentation/location/cubit/location_search/location_search_cubit.dart';

class LocationsPageHeader extends StatelessWidget {
  const LocationsPageHeader({
    super.key,
    required this.progress,
    required this.maxHeight,
    required this.minHeight,
    this.onSearchButton,
    this.focusNode,
    this.onChanged,
  });

  final double progress;

  final double maxHeight;
  final double minHeight;

  final VoidCallback? onSearchButton;

  final FocusNode? focusNode;
  final void Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);
    final padding = MediaQuery.paddingOf(context);

    return Container(
      height: progress.lerp(maxHeight, minHeight),
      decoration: BoxDecoration(
        color: color.surface,
        boxShadow: [
          BoxShadow(
            blurRadius: 30,
            offset: const Offset(0, -4),
            color: const Color(0xFF000000).withAlpha(60),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ).copyWith(top: padding.top, bottom: progress.lerp(0, 8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            heightFactor: 1 - progress,
            child: Opacity(
              opacity: 1 - progress,
              child: AppSearchField(
                hintText: 'Найти локацию',
                focusNode: focusNode,
                onChanged: onChanged,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<LocationSearchCubit, LocationSearchState>(
                builder: (context, searchState) {
                  final locationCount = context.select<LocationCubit, int>(
                    (cubit) => cubit.state.maybeWhen(
                      success: (response, loadMoreState) =>
                          response.locations.length,
                      orElse: () => 0,
                    ),
                  );

                  final searchCount = searchState.maybeWhen(
                    success: (response) => response.locations.length,
                    orElse: () => 0,
                  );

                  final text = searchState.maybeWhen(
                    idle: () => 'Всего локаций: $locationCount',
                    orElse: () => 'Результаты поиска: $searchCount',
                  );

                  return Text(
                    text,
                    style: AppTextStyles.s16w500(color.textSecondary),
                  );
                },
              ),
              Transform.scale(
                scale: progress,
                child: Align(
                  widthFactor: progress,
                  child: Opacity(
                    opacity: progress,
                    child: CupertinoButton(
                      onPressed: onSearchButton,
                      color: color.onSurface,
                      padding: EdgeInsets.zero,
                      child: AppSvgPicture.asset(
                        Svgs.search,
                        color: color.textSecondary,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
