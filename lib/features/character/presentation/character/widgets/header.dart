import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/app/theme/app_color_scheme.dart';
import 'package:rick_and_morty/app/theme/app_text_styles.dart';
import 'package:rick_and_morty/core/extensions/double_extension.dart';
import 'package:rick_and_morty/features/character/presentation/character/cubit/character/character_cubit.dart';
import 'package:rick_and_morty/features/character/presentation/character/cubit/character_search/character_search_cubit.dart';
import 'package:rick_and_morty/shared/resources/resources.dart';
import 'package:rick_and_morty/shared/widgets/app_search_field.dart';
import 'package:rick_and_morty/shared/widgets/app_svg_picture.dart';

class CharactersSearchHeader extends StatelessWidget {
  const CharactersSearchHeader({
    super.key,
    this.isGrid = false,
    required this.maxHeight,
    required this.minHeight,
    required this.progress,
    required this.onGridButton,
    required this.onSearchButton,
    this.onChanged,
    this.focusNode,
  });
  final bool isGrid;

  final double maxHeight;
  final double minHeight;

  final double progress;

  final VoidCallback onSearchButton;
  final VoidCallback onGridButton;

  final FocusNode? focusNode;
  final void Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);
    final padding = MediaQuery.paddingOf(context);

    return Container(
      height: progress.lerp(maxHeight, minHeight),
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 8),
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
      child: Padding(
        padding: EdgeInsets.only(top: padding.top),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Opacity(
              opacity: 1 - progress,
              child: Align(
                heightFactor: 1 - progress,
                child: AppSearchField(
                  focusNode: focusNode,
                  onChanged: onChanged,
                  hintText: 'Найти персонажа',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<CharacterSearchCubit, CharacterSearchState>(
                  builder: (context, searchState) {
                    final characterCount = context.select<CharacterCubit, int>(
                      (cubit) => cubit.state.maybeWhen(
                        success: (response, loadMoreState) =>
                            response.characters.length,
                        orElse: () => 0,
                      ),
                    );

                    final searchCount = searchState.maybeWhen(
                      success: (response) => response.characters.length,
                      orElse: () => 0,
                    );

                    final text = searchState.maybeWhen(
                      idle: () => 'Всего персонажей: $characterCount',
                      orElse: () => 'Результаты поиска: $searchCount',
                    );

                    return Text(
                      text,
                      style: AppTextStyles.s16w500(color.textSecondary),
                    );
                  },
                ),
                Row(
                  children: [
                    CupertinoButton(
                      color: color.onSurface,
                      padding: EdgeInsets.zero,
                      onPressed: onGridButton,
                      child: AppSvgPicture.asset(
                        color: color.textSecondary,
                        isGrid ? Svgs.list : Svgs.grid,
                      ),
                    ),

                    Transform.scale(
                      scale: progress,
                      child: Align(
                        widthFactor: progress,
                        child: Opacity(
                          opacity: progress,
                          child: Row(
                            children: [
                              const SizedBox(width: 8),
                              CupertinoButton(
                                onPressed: onSearchButton,
                                color: color.onSurface,
                                padding: EdgeInsets.zero,
                                child: AppSvgPicture.asset(
                                  Svgs.search,
                                  color: color.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
