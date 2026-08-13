import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rick_and_morty/app/router/app_router.gr.dart';
import 'package:rick_and_morty/app/theme/app_text_styles.dart';
import 'package:rick_and_morty/core/di/injectable.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/features/episode/domain/entities/episode.dart';
import 'package:rick_and_morty/features/episode/presentation/episode/cubit/episode/episode_cubit.dart';
import 'package:rick_and_morty/features/episode/presentation/episode/cubit/episode_search/episode_search_cubit.dart';
import 'package:rick_and_morty/shared/resources/resources.dart';
import 'package:rick_and_morty/app/theme/app_color_scheme.dart';
import 'package:rick_and_morty/features/episode/presentation/episode/widgets/header.dart';
import 'package:rick_and_morty/shared/widgets/app_error_state_widget.dart';
import 'package:rick_and_morty/shared/widgets/app_loading_state_widget.dart';

@RoutePage()
class EpisodesPage extends StatefulWidget implements AutoRouteWrapper {
  const EpisodesPage({super.key});

  @override
  State<EpisodesPage> createState() => _EpisodesPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<EpisodeCubit>()..started()),
        BlocProvider(create: (context) => getIt<EpisodeSearchCubit>()),
      ],
      child: this,
    );
  }
}

class _EpisodesPageState extends State<EpisodesPage> {
  final _focusNode = FocusNode();
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController(
      onAttach: (position) =>
          position.isScrollingNotifier.addListener(_onScrollChanged),
      onDetach: (position) =>
          position.isScrollingNotifier.addListener(_onScrollChanged),
    );

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
  }

  double _progress = 0.0;
  double get progress => _progress;

  double get minHeight => 55 + padding.top;
  double get maxHeight => 110 + padding.top;

  double get collapseRange => maxHeight - minHeight;

  EdgeInsets get padding => MediaQuery.paddingOf(context);

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
    final episodeCubit = context.read<EpisodeCubit>();
    final searchCubit = context.read<EpisodeSearchCubit>();

    return Scaffold(
      body: Column(
        children: [
          EpisodesPageHeader(
            progress: progress,
            maxHeight: maxHeight,
            minHeight: minHeight,
            focusNode: _focusNode,
            onSearchButton: _onSearchButton,
            onChanged: (name) => searchCubit.search(name),
          ),
          Expanded(
            child: BlocBuilder<EpisodeCubit, EpisodeState>(
              builder: (context, state) => state.when(
                success: (response, loadMoreState) =>
                    BlocBuilder<EpisodeSearchCubit, EpisodeSearchState>(
                      builder: (context, state) => state.when(
                        idle: () =>
                            NotificationListener<UserScrollNotification>(
                              onNotification: (notification) {
                                if (notification.direction ==
                                    ScrollDirection.idle) {
                                  final pixels = notification.metrics.pixels;
                                  final maxScrollExtent =
                                      notification.metrics.maxScrollExtent;

                                  if (pixels >= (maxScrollExtent - 200)) {
                                    final nextPageUrl = response.info.next;

                                    if (nextPageUrl != null) {
                                      episodeCubit.loadMore(nextPageUrl);
                                    }
                                  }
                                }

                                return false;
                              },
                              child: CustomScrollView(
                                controller: _scrollController,
                                slivers: [
                                  SliverPadding(
                                    padding: const EdgeInsets.all(16),
                                    sliver: SliverList.separated(
                                      itemCount: response.episodes.length,
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(height: 24),
                                      itemBuilder: (context, index) {
                                        final episode =
                                            response.episodes[index];
                                        return EpisodeCard(
                                          episode,
                                          key: ValueKey(episode.id),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        success: (response) => ListView.separated(
                          padding: const EdgeInsets.all(16),
                          itemCount: response.episodes.length,
                          itemBuilder: (context, index) {
                            final episode = response.episodes[index];
                            return EpisodeCard(
                              episode,
                              key: ValueKey(episode.id),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 24),
                        ),
                        error: (failure) => failure.maybeWhen(
                          notFound: () => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(Images.cucumber),
                              const SizedBox(height: 20),
                              Text(
                                'Эпизод с таким именем не найден',
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
                    ),
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
        ],
      ),
    );
  }
}

class EpisodeCard extends StatelessWidget {
  final Episode episode;
  const EpisodeCard(this.episode, {super.key});

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);
    final formatter = DateFormat('dd MMMM yyyy');

    return SizedBox(
      height: 60,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () => context.pushRoute(EpisodeDetailRoute(id: episode.id)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                Images.image,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Серия ${episode.id}',
                    style: AppTextStyles.s12w400(const Color(0xFF22A2BD)),
                  ),
                  Text(
                    episode.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.s16w500(color.textPrimary),
                  ),
                  Text(
                    formatter.format(episode.created),
                    style: AppTextStyles.s15w500(color.textSecondary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
