import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/app/theme/app_color_scheme.dart';
import 'package:rick_and_morty/app/theme/app_text_styles.dart';
import 'package:rick_and_morty/features/character/presentation/characters/bloc/characters/characters_bloc.dart';
import 'package:rick_and_morty/features/character/presentation/characters/bloc/characters_search/characters_search_bloc.dart';
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

    final searchBloc = context.watch<CharactersSearchBloc>();
    final charactersBloc = context.watch<CharactersBloc>();

    return Container(
      height: lerpDouble(maxHeight, minHeight, progress),
      padding: EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 8),
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
                Text(
                  searchBloc.state.maybeWhen(
                    idle: () =>
                        'Всего персонажей: ${charactersBloc.state.maybeWhen(success: (response, _) => response.characters.length, orElse: () => 0)}',
                    orElse: () =>
                        'Результаты поиска: ${searchBloc.state.maybeWhen(success: (response) => response.characters.length, orElse: () => 0)}',
                  ),
                  style: AppTextStyles.s15w500(color.textSecondary),
                ),
                Row(
                  children: [
                    CupertinoButton(
                      color: color.onSurface,
                      padding: EdgeInsets.zero,
                      onPressed: onGridButton,
                      child: AppSvgPicture(
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
                              SizedBox(width: 8),
                              CupertinoButton(
                                onPressed: onSearchButton,
                                color: color.onSurface,
                                padding: EdgeInsets.zero,
                                child: AppSvgPicture(
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
