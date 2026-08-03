import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/app/theme/app_color_scheme.dart';
import 'package:rick_and_morty/app/theme/app_text_styles.dart';
import 'package:rick_and_morty/features/location/presentation/locations/bloc/locations/locations_bloc.dart';
import 'package:rick_and_morty/features/location/presentation/locations/bloc/locations_search/locations_search_bloc.dart';
import 'package:rick_and_morty/shared/resources/resources.dart';
import 'package:rick_and_morty/shared/widgets/app_search_field.dart';
import 'package:rick_and_morty/shared/widgets/app_svg_picture.dart';

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

    final searchBloc = context.watch<LocationsSearchBloc>();
    final locationsBloc = context.watch<LocationsBloc>();

    return Container(
      height: lerpDouble(maxHeight, minHeight, progress),
      decoration: BoxDecoration(
        color: color.surface,
        boxShadow: [
          BoxShadow(
            blurRadius: 30,
            offset: Offset(0, -4),
            color: Color(0xFF000000).withAlpha(60),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ).copyWith(top: padding.top, bottom: lerpDouble(0, 8, progress)),
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
              Text(
                searchBloc.state.maybeWhen(
                  idle: () =>
                      'Всего локаций: ${locationsBloc.state.maybeWhen(success: (response, loadMoreState) => response.locations.length, orElse: () => 0)}',
                  orElse: () =>
                      'Результаты поиска: ${searchBloc.state.maybeWhen(success: (response) => response.locations.length, orElse: () => 0)}',
                ),
                style: AppTextStyles.s16w500(color.textSecondary),
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
                      child: AppSvgPicture(
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
