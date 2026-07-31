import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/di/injectable.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/app/theme/app_text_styles.dart';
import 'package:rick_and_morty/app/theme/app_color_scheme.dart';
import 'package:rick_and_morty/features/characters/presentation/characters/bloc/characters/characters_bloc.dart';
import 'package:rick_and_morty/features/characters/presentation/characters/bloc/characters_search/characters_search_bloc.dart';
import 'package:rick_and_morty/features/characters/presentation/characters/widgets/character_grid_card.dart';
import 'package:rick_and_morty/features/characters/presentation/characters/widgets/character_list_card.dart';
import 'package:rick_and_morty/features/characters/presentation/characters/widgets/header.dart';
import 'package:rick_and_morty/shared/resources/resources.dart';
import 'package:rick_and_morty/shared/widgets/app_error_state_widget.dart';
import 'package:rick_and_morty/shared/widgets/app_loading_state_widget.dart';

@RoutePage()
class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  bool isGrid = false;
  double _progress = 0.0;

  late final FocusNode _focusNode;
  late final ScrollController _scrollController;

  late final CharactersBloc _charactersBloc;
  late final CharactersSearchBloc _charactersSearchBloc;

  double get progress => _progress;

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

    _focusNode = FocusNode();

    _charactersBloc = getIt<CharactersBloc>()..add(CharactersEvent.started());
    _charactersSearchBloc = getIt<CharactersSearchBloc>();

    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final pixels = _scrollController.position.pixels;
    final progress = (pixels / collapseRange).clamp(0.0, 1.0);

    if (this.progress == progress) return;

    setState(() => _progress = progress);
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

  @override
  void dispose() {
    _scrollController.dispose();

    _focusNode.dispose();

    _charactersBloc.close();
    _charactersSearchBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _charactersBloc),
        BlocProvider.value(value: _charactersSearchBloc),
      ],
      child: Scaffold(
        body: Column(
          children: [
            CharactersSearchHeader(
              progress: progress,
              maxHeight: maxHeight,
              minHeight: minHeight,
              isGrid: isGrid,
              focusNode: _focusNode,
              onChanged: (value) => _charactersSearchBloc.add(
                CharactersSearchEvent.search(value),
              ),
              onGridButton: () => setState(() => isGrid = !isGrid),
              onSearchButton: () {
                _scrollController
                    .animateTo(
                      0.0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    )
                    .whenComplete(() {
                      if (!_focusNode.hasFocus) _focusNode.requestFocus();
                    });
              },
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: BlocBuilder<CharactersBloc, CharactersState>(
                  builder: (context, state) => state.maybeWhen(
                    success: (response, loadMoreState) {
                      return BlocBuilder<
                        CharactersSearchBloc,
                        CharactersSearchState
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
                                    _charactersBloc.add(
                                      CharactersEvent.loadMore(nextPageUrl),
                                    );
                                  }
                                }
                              }

                              return false;
                            },
                            child: CustomScrollView(
                              controller: _scrollController,
                              slivers: [
                                SliverPadding(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  sliver: SliverGrid.builder(
                                    itemCount: response.characters.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: isGrid ? 2 : 1,
                                          crossAxisSpacing: 16,
                                          mainAxisSpacing: 24,
                                          mainAxisExtent: isGrid ? 200 : 74,
                                        ),
                                    itemBuilder: (context, index) {
                                      final character =
                                          response.characters[index];
                                      return isGrid
                                          ? CharacterGridCard(character)
                                          : CharacterListCard(character);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          success: (response) => CustomScrollView(
                            slivers: [
                              SliverPadding(
                                padding: EdgeInsets.all(16),
                                sliver: SliverGrid.builder(
                                  itemCount: response.characters.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: isGrid ? 2 : 1,
                                        crossAxisSpacing: 16,
                                        mainAxisSpacing: 24,
                                        mainAxisExtent: isGrid ? 200 : 74,
                                      ),
                                  itemBuilder: (context, index) {
                                    final character =
                                        response.characters[index];
                                    return isGrid
                                        ? CharacterGridCard(character)
                                        : CharacterListCard(character);
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

                    error: (failure) => AppErrorStateWidget(
                      title: failure.maybeWhen(
                        noConnection: () => 'Нет подключения к сети',
                        requestLimit: () => 'Слишком много запросов',
                        orElse: () => 'Упс! Что-то пошло не так',
                      ),
                    ),
                    orElse: () => AppLoadingStateWidget(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
