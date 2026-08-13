import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/di/injectable.dart';
import 'package:rick_and_morty/app/router/app_router.gr.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/shared/widgets/app_image.dart';
import 'package:rick_and_morty/app/theme/app_text_styles.dart';
import 'package:rick_and_morty/app/theme/app_color_scheme.dart';
import 'package:rick_and_morty/shared/resources/resources.dart';
import 'package:rick_and_morty/shared/widgets/app_svg_picture.dart';
import 'package:rick_and_morty/core/extensions/string_extension.dart';
import 'package:rick_and_morty/shared/widgets/app_error_state_widget.dart';
import 'package:rick_and_morty/shared/widgets/app_loading_state_widget.dart';
import 'package:rick_and_morty/features/character/domain/entities/character.dart';
import 'package:rick_and_morty/shared/widgets/sliver_progress_header_delegate.dart';
import 'package:rick_and_morty/features/location/presentation/location_detail/widgets/header.dart';
import 'package:rick_and_morty/features/location/presentation/location_detail/cubit/location_detail/location_detail_cubit.dart';
import 'package:rick_and_morty/features/location/presentation/location_detail/cubit/location_residents/location_residents_cubit.dart';

@RoutePage()
class LocationDetailPage extends StatelessWidget implements AutoRouteWrapper {
  final int id;
  const LocationDetailPage(this.id, {super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final loactionCubit = getIt<LocationDetailCubit>();
            loactionCubit.load(id);
            return loactionCubit;
          },
        ),
        BlocProvider(create: (context) => getIt<LocationResidentsCubit>()),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final residentsCubit = context.read<LocationResidentsCubit>();

    final color = AppColorScheme.of(context);
    final padding = MediaQuery.paddingOf(context);

    final maxHeight = 200.0 + padding.top;
    final minHeight = 50.0 + padding.top;

    return Scaffold(
      body: BlocConsumer<LocationDetailCubit, LocationDetailState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (location) => residentsCubit.load(location.residentUrls),

            orElse: () {},
          );
        },
        builder: (context, state) => state.when(
          success: (location) => Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: maxHeight,
                child: Image.asset(Images.park, fit: BoxFit.fill),
              ),
              Positioned.fill(
                child: CustomScrollView(
                  slivers: [
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: SliverProgressHeaderDelegate(
                        maxExtent: maxHeight,
                        minExtent: minHeight,
                        builder: (context, progress) {
                          return LocationDetailPageHeader(
                            location,
                            progress: progress,
                          );
                        },
                      ),
                    ),
                    DecoratedSliver(
                      decoration: BoxDecoration(color: color.background),
                      sliver: SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        sliver: SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                location.name,
                                style: AppTextStyles.s24w700(color.textPrimary),
                              ),

                              const SizedBox(height: 5),

                              Text(
                                location.dimension,
                                style: AppTextStyles.s15w500(
                                  color.textSecondary,
                                ),
                              ),

                              const SizedBox(height: 30),

                              Text(
                                'Это планета, на которой проживает человеческая раса, и главное место для персонажей Рика и Морти. Возраст этой Земли более 4,6 миллиардов лет, и она является четвертой планетой от своей звезды.',
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
                          ).copyWith(bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Жители',
                                style: AppTextStyles.s24w700(color.textPrimary),
                              ),
                              Text(
                                'Все жители',
                                style: AppTextStyles.s16w500(
                                  color.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    DecoratedSliver(
                      decoration: BoxDecoration(color: color.background),
                      sliver: SliverPadding(
                        padding: const EdgeInsets.all(
                          16,
                        ).copyWith(bottom: padding.bottom),
                        sliver:
                            BlocBuilder<
                              LocationResidentsCubit,
                              LocationResidentsState
                            >(
                              builder: (context, state) => state.when(
                                success: (characters) => SliverList.separated(
                                  itemCount: characters.length,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(height: 24),
                                  itemBuilder: (context, index) {
                                    final character = characters[index];
                                    return ResidentCard(
                                      character,
                                      key: ValueKey(character.id),
                                    );
                                  },
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
                                loading: () => const SliverFillRemaining(
                                  child: AppLoadingStateWidget(),
                                ),
                              ),
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          loading: () => const AppLoadingStateWidget(),
          error: (failure) => AppErrorStateWidget(
            title: failure.when(
              noConnection: () => 'Нет подключения к сети',
              requestLimit: () => 'Слишком много запросов',
              notFound: () => 'Локация не найдена',
              unknown: () => 'Упс! Что-то пошло не так',
            ),
          ),
        ),
      ),
    );
  }
}

class ResidentCard extends StatelessWidget {
  final Character character;
  const ResidentCard(this.character, {super.key});

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);

    return SizedBox(
      height: 74,
      child: CupertinoButton(
        onPressed: () =>
            context.pushRoute(CharacterDetailRoute(id: character.id)),
        padding: EdgeInsets.zero,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    character.status.name.capitalize(),
                    style: AppTextStyles.s15w500(const Color(0xFF43D049)),
                  ),
                  Text(
                    character.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.s16w500(color.textPrimary),
                  ),
                  Text(
                    '${character.species}, ${character.gender.name}',
                    style: AppTextStyles.s16w500(color.textSecondary),
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
