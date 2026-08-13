import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/di/injectable.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/app/theme/app_text_styles.dart';
import 'package:rick_and_morty/app/theme/app_color_scheme.dart';
import 'package:rick_and_morty/features/character/presentation/character/cubit/character/character_cubit.dart';
import 'package:rick_and_morty/features/character/presentation/character/cubit/character_search/character_search_cubit.dart';
import 'package:rick_and_morty/features/character/presentation/character/widgets/character_grid_card.dart';
import 'package:rick_and_morty/features/character/presentation/character/widgets/character_list_card.dart';
import 'package:rick_and_morty/features/character/presentation/character/widgets/header.dart';
import 'package:rick_and_morty/shared/resources/resources.dart';
import 'package:rick_and_morty/shared/widgets/app_error_state_widget.dart';
import 'package:rick_and_morty/shared/widgets/app_loading_state_widget.dart';

@RoutePage()
class CharactersPage extends StatefulWidget implements AutoRouteWrapper {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<CharacterCubit>()..started()),
        BlocProvider(create: (context) => getIt<CharacterSearchCubit>()),
      ],
      child: this,
    );
  }
}

class _CharactersPageState extends State<CharactersPage> {
  bool isGrid = false;

  final _focusNode = FocusNode();
  final _progress = ValueNotifier<double>(0);

  late final ScrollController _scrollController;

  double get maxHeight => 125 + padding.top;
  double get minHeight => 55 + padding.top;

  double get collapseRange => maxHeight - minHeight;

  EdgeInsets get padding => MediaQuery.paddingOf(context);

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(
      onAttach: (position) {
        position.isScrollingNotifier.addListener(_onScrollChanged);
      },
      onDetach: (position) =>
          position.isScrollingNotifier.removeListener(_onScrollChanged),
    );

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();

    _focusNode.dispose();
    _progress.dispose();

    super.dispose();
  }

  void _onScroll() {
    final pixels = _scrollController.position.pixels;
    final progress = (pixels / collapseRange).clamp(0.0, 1.0);

    if (_progress.value == progress) return;

    _progress.value = progress;
  }

  void _onScrollChanged() {
    final position = _scrollController.position;
    final isScrolling = position.isScrollingNotifier.value;

    if (!isScrolling) {
      final pixels = position.pixels;
      final progress = (pixels / collapseRange).clamp(0.0, 1.0);

      if (progress == 1.0 || progress == 0.0) return;

      _scrollController.animateTo(
        progress > 0.5 ? collapseRange : 0.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _onSearchButton() {
    _scrollController
        .animateTo(
          0.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        )
        .whenComplete(() {
          if (!_focusNode.hasFocus) _focusNode.requestFocus();
        });
  }

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);

    final characterCubit = context.read<CharacterCubit>();
    final searchCubit = context.read<CharacterSearchCubit>();

    return Scaffold(
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: _progress,
            builder: (context, value, child) => CharactersSearchHeader(
              progress: value,
              maxHeight: maxHeight,
              minHeight: minHeight,
              isGrid: isGrid,
              focusNode: _focusNode,
              onChanged: (value) => searchCubit.search(value),
              onGridButton: () => setState(() => isGrid = !isGrid),
              onSearchButton: _onSearchButton,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: BlocBuilder<CharacterCubit, CharacterState>(
                builder: (context, state) => state.when(
                  success: (response, loadMoreState) {
                    return BlocBuilder<
                      CharacterSearchCubit,
                      CharacterSearchState
                    >(
                      builder: (context, state) => state.when(
                        idle: () => NotificationListener<UserScrollNotification>(
                          onNotification: (notification) {
                            if (notification.direction ==
                                ScrollDirection.idle) {
                              final pixels = notification.metrics.pixels;
                              final maxScrollExtent =
                                  notification.metrics.maxScrollExtent;

                              if (pixels >= (maxScrollExtent - 200)) {
                                final nextPageUrl = response.info.next;

                                if (nextPageUrl != null) {
                                  characterCubit.loadMore(nextPageUrl);
                                }
                              }
                            }

                            return false;
                          },
                          child: CustomScrollView(
                            controller: _scrollController,
                            slivers: [
                              SliverPadding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                sliver: SliverGrid.builder(
                                  itemCount: response.characters.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: isGrid ? 2 : 1,
                                        crossAxisSpacing: 16,
                                        mainAxisSpacing: 24,
                                        mainAxisExtent: isGrid ? 190 : 74,
                                      ),
                                  itemBuilder: (context, index) {
                                    final character =
                                        response.characters[index];
                                    return isGrid
                                        ? CharacterGridCard(
                                            key: ValueKey(character.id),
                                            character,
                                          )
                                        : CharacterListCard(
                                            key: ValueKey(character.id),
                                            character,
                                          );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        success: (response) => CustomScrollView(
                          slivers: [
                            SliverPadding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              sliver: SliverGrid.builder(
                                itemCount: response.characters.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: isGrid ? 2 : 1,
                                      crossAxisSpacing: 16,
                                      mainAxisSpacing: 24,
                                      mainAxisExtent: isGrid ? 190 : 74,
                                    ),
                                itemBuilder: (context, index) {
                                  final character = response.characters[index];
                                  return isGrid
                                      ? CharacterGridCard(
                                          key: ValueKey(character.id),
                                          character,
                                        )
                                      : CharacterListCard(
                                          key: ValueKey(character.id),
                                          character,
                                        );
                                },
                              ),
                            ),
                          ],
                        ),
                        error: (failure) => failure.maybeWhen(
                          notFound: () => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(Images.boy),
                              const SizedBox(height: 20),
                              Text(
                                'Персонаж с таким именем не найден',
                                style: AppTextStyles.s16w500(
                                  color.textSecondary,
                                ),
                              ),
                            ],
                          ),
                          orElse: () => AppErrorStateWidget(
                            title: failure.maybeWhen(
                              noConnection: () => 'Нет подключения к сети',
                              requestLimit: () => 'Слишком много запросов',
                              orElse: () => 'Упс! Что-то пошло не так',
                            ),
                          ),
                        ),
                      ),
                    );
                  },

                  loading: () => const AppLoadingStateWidget(),
                  error: (failure) => AppErrorStateWidget(
                    title: failure.maybeWhen(
                      noConnection: () => 'Нет подключения к сети',
                      requestLimit: () => 'Слишком много запросов',
                      orElse: () => 'Упс! Что-то пошло не так',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
