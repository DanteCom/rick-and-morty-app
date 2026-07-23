import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:rick_and_morty/app/theme/app_color_scheme.dart';
import 'package:rick_and_morty/app/theme/app_text_styles.dart';
import 'package:rick_and_morty/shared/resources/resources.dart';
import 'package:rick_and_morty/shared/widgets/app_search_field.dart';
import 'package:rick_and_morty/shared/widgets/app_svg_picture.dart';

@RoutePage()
class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  double _progress = 0.0;
  bool isGrid = false;

  late final ScrollController _controller;
  late final TextEditingController _searchController;

  double get progress => _progress;

  double get maxHeight => 125 + padding.top;
  double get minHeight => 55 + padding.top;

  double get collapseRange => maxHeight - minHeight;

  EdgeInsets get padding => MediaQuery.paddingOf(context);

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _searchController = TextEditingController();

    _controller.addListener(() {
      final pixels = _controller.position.pixels;
      final progress = (pixels / collapseRange).clamp(0.0, 1.0);

      if (this.progress == progress) return;

      setState(() => _progress = progress);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _Header(
            maxHeight: maxHeight,
            minHeight: minHeight,
            isGrid: isGrid,
            progress: progress,
            hintText: 'Найти персонажа',
            controller: _searchController,
            onGridButton: () => setState(() => isGrid = !isGrid),
            onSearchButton: () {
              _controller.animateTo(
                0.0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
          ),
          NotificationListener<ScrollEndNotification>(
            onNotification: (notification) {
              if (progress == 1.0 || progress == 0.0) return false;

              WidgetsBinding.instance.addPostFrameCallback((_) {
                _controller.animateTo(
                  progress > 0.5 ? collapseRange : 0.0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              });

              return false;
            },
            child: Expanded(
              child: CustomScrollView(
                controller: _controller,
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.all(16),
                    sliver: SliverGrid.builder(
                      itemCount: 10,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isGrid ? 2 : 1,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 24,
                        mainAxisExtent: isGrid ? 200 : 74,
                      ),
                      itemBuilder: (context, index) =>
                          isGrid ? _CharacterGridCard() : _CharacterListCard(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CharacterListCard extends StatelessWidget {
  const _CharacterListCard();

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);
    return Row(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(shape: BoxShape.circle),
          width: 74,
          height: 74,
          child: Image.asset(Images.image),
        ),
        SizedBox(width: 18),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Живой', style: AppTextStyles.s15w500(Color(0xFF43D049))),
            Text('Рик Cанчез', style: AppTextStyles.s16w500(color.textPrimary)),
            Text(
              'Человек, Мужской',
              style: AppTextStyles.s16w500(color.textSecondary),
            ),
          ],
        ),
      ],
    );
  }
}

class _CharacterGridCard extends StatelessWidget {
  const _CharacterGridCard();

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);
    return Column(
      children: [
        Container(
          height: 120,
          width: 120,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Image.asset(Images.image, fit: BoxFit.cover),
        ),
        SizedBox(height: 18),
        Text('Живой', style: AppTextStyles.s12w400(Color(0xFF43D049))),
        Text('Рик Cанчез', style: AppTextStyles.s15w500(color.textPrimary)),
        Text(
          'Человек, Мужской',
          style: AppTextStyles.s12w400(color.textSecondary),
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    this.isGrid = false,
    required this.maxHeight,
    required this.minHeight,
    required this.progress,
    required this.onSearchButton,
    required this.onGridButton,
    required this.hintText,
    required this.controller,
  });
  final bool isGrid;

  final double maxHeight;
  final double minHeight;

  final double progress;

  final VoidCallback onSearchButton;
  final VoidCallback onGridButton;

  final String hintText;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);
    final padding = MediaQuery.paddingOf(context);

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
                  controller: controller,
                  hintText: hintText,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Всего персонажей: 200',
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
