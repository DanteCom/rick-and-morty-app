import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/app/router/app_router.gr.dart';
import 'package:rick_and_morty/core/di/injectable.dart';
import 'package:rick_and_morty/app/theme/app_text_styles.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/shared/resources/resources.dart';
import 'package:rick_and_morty/app/theme/app_color_scheme.dart';
import 'package:rick_and_morty/core/extensions/string_extension.dart';
import 'package:rick_and_morty/features/episode/domain/entities/episode.dart';
import 'package:rick_and_morty/shared/widgets/app_error_state_widget.dart';
import 'package:rick_and_morty/shared/widgets/app_loading_state_widget.dart';
import 'package:rick_and_morty/shared/widgets/app_svg_picture.dart';
import 'package:rick_and_morty/shared/widgets/sliver_progress_header_delegate.dart';
import 'package:rick_and_morty/features/character/presentation/character_detail/widgets/header.dart';
import 'package:rick_and_morty/features/character/presentation/character_detail/cubit/character_episodes/character_episodes_cubit.dart';
import 'package:rick_and_morty/features/character/presentation/character_detail/cubit/character_detail/character_detail_cubit.dart';

@RoutePage()
class CharacterDetailPage extends StatelessWidget implements AutoRouteWrapper {
  final int id;
  const CharacterDetailPage(this.id, {super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final characterCubit = getIt<CharacterDetailCubit>();
            characterCubit.started(id);
            return characterCubit;
          },
        ),
        BlocProvider(create: (context) => getIt<CharacterEpisodesCubit>()),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);
    final episodesCubit = context.read<CharacterEpisodesCubit>();

    final padding = MediaQuery.paddingOf(context);

    final maxHeight = 300 + padding.top;
    final minHeight = 50 + padding.top;

    return Scaffold(
      body: BlocConsumer<CharacterDetailCubit, CharacterDetailState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (character) => episodesCubit.load(character.episodeUrls),
            orElse: () {},
          );
        },
        builder: (context, state) => state.when(
          success: (character) => CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: SliverProgressHeaderDelegate(
                  maxExtent: maxHeight,
                  minExtent: minHeight,
                  builder: (context, progress) => CharacterDetailPageHeader(
                    character,
                    maxHeight: maxHeight,
                    minHeight: minHeight,
                    progress: progress,
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Text(
                            character.name,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.s34w400(color.textPrimary),
                          ),
                          Text(
                            character.status.name.toUpperCase(),
                            style: AppTextStyles.s15w500(
                              const Color(0xFF43D049),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Пол',
                                      style: AppTextStyles.s15w500(
                                        color.textSecondary,
                                      ),
                                    ),
                                    Text(
                                      character.gender.name.capitalize(),
                                      style: AppTextStyles.s16w500(
                                        color.textPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Расса',
                                      style: AppTextStyles.s15w500(
                                        color.textSecondary,
                                      ),
                                    ),
                                    Text(
                                      character.species,
                                      style: AppTextStyles.s16w500(
                                        color.textPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          _buildLocationButton(
                            color,
                            title: 'Место рождения',
                            label: character.origin.name,
                            onPressed: () {},
                          ),
                          _buildLocationButton(
                            color,
                            title: 'Местоположение',
                            label: character.location.name,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 36),
                      child: Container(
                        height: 3,
                        width: double.infinity,
                        color: color.onSurface,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Эпизоды',
                                style: AppTextStyles.s22w500(color.textPrimary),
                              ),
                              Text(
                                'Все эпизоды',
                                style: AppTextStyles.s16w500(
                                  color.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ).copyWith(top: 24, bottom: 24 + padding.bottom),
                sliver:
                    BlocBuilder<CharacterEpisodesCubit, CharacterEpisodesState>(
                      builder: (context, state) => state.when(
                        success: (episodes) {
                          return SliverList.separated(
                            itemCount: episodes.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 24),
                            itemBuilder: (context, index) {
                              final episode = episodes[index];

                              return EpisodeCard(
                                key: ValueKey(episode.id),
                                episode: episode,
                              );
                            },
                          );
                        },
                        loading: () => const SliverToBoxAdapter(
                          child: AppLoadingStateWidget(),
                        ),
                        error: (failure) => SliverToBoxAdapter(
                          child: AppErrorStateWidget(
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
          error: (failure) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AppErrorStateWidget(
              title: failure.when(
                noConnection: () => 'Нет подключения к сети',
                requestLimit: () => 'Слишком много запросов',
                notFound: () => 'Персонаж не найден',
                unknown: () => 'Упс! Что-то пошло не так',
              ),
            ),
          ),
          loading: () => const AppLoadingStateWidget(),
        ),
      ),
    );
  }

  CupertinoButton _buildLocationButton(
    AppColorScheme color, {
    required String title,
    required String label,
    required VoidCallback onPressed,
  }) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.s15w500(color.textSecondary)),
                const SizedBox(height: 5),
                Text(label, style: AppTextStyles.s16w500(color.textPrimary)),
              ],
            ),
          ),
          AppSvgPicture.asset(
            Svgs.arrowRight,
            size: 30,
            color: color.textPrimary,
          ),
        ],
      ),
    );
  }
}

class EpisodeCard extends StatelessWidget {
  final Episode episode;
  const EpisodeCard({super.key, required this.episode});

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);
    final formatter = DateFormat('dd MMMM yyyy');

    return SizedBox(
      height: 74,
      child: CupertinoButton(
        onPressed: () => context.pushRoute(EpisodeDetailRoute(id: episode.id)),
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            Container(
              width: 74,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(Images.image, fit: BoxFit.cover),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
            ),
            AppSvgPicture.asset(
              Svgs.arrowRight,
              size: 30,
              color: color.textPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
