import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/di/injectable.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/shared/widgets/app_image.dart';
import 'package:rick_and_morty/app/router/app_router.gr.dart';
import 'package:rick_and_morty/app/theme/app_text_styles.dart';
import 'package:rick_and_morty/app/theme/app_color_scheme.dart';
import 'package:rick_and_morty/shared/resources/resources.dart';
import 'package:rick_and_morty/shared/widgets/app_svg_picture.dart';
import 'package:rick_and_morty/core/extensions/string_extension.dart';
import 'package:rick_and_morty/shared/widgets/app_error_state_widget.dart';
import 'package:rick_and_morty/shared/widgets/app_loading_state_widget.dart';
import 'package:rick_and_morty/features/character/domain/entities/character.dart';
import 'package:rick_and_morty/shared/widgets/sliver_progress_header_delegate.dart';
import 'package:rick_and_morty/features/episode/presentation/episode_detail/widgets/header.dart';
import 'package:rick_and_morty/features/episode/presentation/episode_detail/cubit/episode_detail_cubit.dart';
import 'package:rick_and_morty/features/episode/presentation/episode_detail/cubit/episode_character_cubit.dart';

@RoutePage()
class EpisodeDetailPage extends StatelessWidget implements AutoRouteWrapper {
  final int id;
  const EpisodeDetailPage(this.id, {super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<EpisodeDetailCubit>()..load(id),
        ),
        BlocProvider(create: (context) => getIt<EpisodeCharacterCubit>()),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);
    final characterCubit = context.read<EpisodeCharacterCubit>();

    final padding = MediaQuery.paddingOf(context);

    final minHeight = 50 + padding.top;
    final maxHeight = 200 + padding.top;

    return Scaffold(
      body: BlocConsumer<EpisodeDetailCubit, EpisodeDetailState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (episode) => characterCubit.load(episode.characters),
            orElse: () {},
          );
        },
        builder: (context, state) => state.when(
          success: (episode) => Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                left: 0,
                right: 0,
                height: maxHeight,
                child: Image.asset(Images.image, fit: BoxFit.fill),
              ),

              CustomScrollView(
                slivers: [
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: SliverProgressHeaderDelegate(
                      maxExtent: maxHeight,
                      minExtent: minHeight,
                      builder: (context, progress) => EpisodeDetailPageHeader(
                        minHeight: minHeight,
                        progress: progress,
                      ),
                    ),
                  ),
                  DecoratedSliver(
                    decoration: BoxDecoration(color: color.background),
                    sliver: SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      sliver: SliverToBoxAdapter(
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Text(
                              episode.name,
                              style: AppTextStyles.s24w700(color.textPrimary),
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: 5),

                            Text(
                              'Серия ${episode.id}',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.s16w500(
                                const Color(0xFF22A2BD),
                              ),
                            ),

                            const SizedBox(height: 30),

                            Text(
                              'Зигерионцы помещают Джерри и Рика в симуляцию, чтобы узнать секрет изготовления концен-трирован- ной темной материи.',
                              style: AppTextStyles.s15w500(color.textPrimary),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  DecoratedSliver(
                    decoration: BoxDecoration(color: color.background),
                    sliver: SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Divider(
                          color: color.textSecondary,
                          thickness: 2,
                        ),
                      ),
                    ),
                  ),

                  DecoratedSliver(
                    decoration: BoxDecoration(color: color.background),
                    sliver: SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ).copyWith(bottom: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Персонажи',
                              style: AppTextStyles.s24w700(color.textPrimary),
                            ),
                            Text(
                              'Все персонажи',
                              style: AppTextStyles.s16w500(color.textSecondary),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  DecoratedSliver(
                    decoration: BoxDecoration(color: color.background),
                    sliver: SliverPadding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ).copyWith(bottom: padding.bottom),
                      sliver:
                          BlocBuilder<
                            EpisodeCharacterCubit,
                            EpisodeCharacterState
                          >(
                            builder: (context, state) => state.when(
                              success: (characters) => SliverList.separated(
                                itemCount: characters.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 24),
                                itemBuilder: (context, index) {
                                  final character = characters[index];
                                  return CharacterCard(
                                    key: ValueKey(character.id),
                                    character,
                                  );
                                },
                              ),
                              loading: () => const SliverToBoxAdapter(
                                child: AppLoadingStateWidget(),
                              ),
                              error: (failure) => SliverToBoxAdapter(
                                child: AppErrorStateWidget(
                                  title: failure.maybeWhen(
                                    noConnection: () =>
                                        'Нет подключения к сети',
                                    requestLimit: () =>
                                        'Слишком много запросов',
                                    orElse: () => 'Упс! Что-то пошло не так',
                                  ),
                                ),
                              ),
                            ),
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          loading: () => const AppLoadingStateWidget(),
          error: (failure) => AppErrorStateWidget(
            title: failure.when(
              noConnection: () => 'Нет подключения к сети',
              requestLimit: () => 'Слишком много запросов',
              notFound: () => 'Эпизод не найден',
              unknown: () => 'Упс! Что-то пошло не так',
            ),
          ),
        ),
      ),
    );
  }
}

class CharacterCard extends StatelessWidget {
  final Character character;
  const CharacterCard(this.character, {super.key});

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);

    return SizedBox(
      height: 74,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () =>
            context.pushRoute(CharacterDetailRoute(id: character.id)),
        child: Row(
          children: [
            Container(
              width: 74,
              height: 74,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: AppImage.network(character.image, fit: BoxFit.cover),
            ),

            const SizedBox(width: 18),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    character.status.name.capitalize(),
                    style: AppTextStyles.s12w400(const Color(0xFF43D049)),
                  ),
                  Text(
                    character.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.s16w500(color.textPrimary),
                  ),
                  Text(
                    '${character.species}, ${character.gender.name.capitalize()}',
                    style: AppTextStyles.s15w500(color.textSecondary),
                  ),
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
      ),
    );
  }
}
