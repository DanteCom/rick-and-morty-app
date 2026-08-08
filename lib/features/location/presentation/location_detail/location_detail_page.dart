import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/di/injectable.dart';
import 'package:rick_and_morty/app/theme/app_text_styles.dart';
import 'package:rick_and_morty/app/theme/app_color_scheme.dart';
import 'package:rick_and_morty/shared/resources/resources.dart';
import 'package:rick_and_morty/shared/widgets/app_error_state_widget.dart';
import 'package:rick_and_morty/shared/widgets/app_loading_state_widget.dart';
import 'package:rick_and_morty/shared/widgets/sliver_progress_header_delegate.dart';
import 'package:rick_and_morty/features/location/presentation/location_detail/widgets/header.dart';
import 'package:rick_and_morty/features/character/presentation/characters/widgets/character_list_card.dart';
import 'package:rick_and_morty/features/location/presentation/location_detail/bloc/location_detail/location_detail_bloc.dart';
import 'package:rick_and_morty/features/location/presentation/location_detail/bloc/location_residents/location_residents_bloc.dart';

@RoutePage()
class LocationDetailPage extends StatelessWidget implements AutoRouteWrapper {
  const LocationDetailPage(this.id, {super.key});

  final int id;

  @override
  Widget build(BuildContext context) {
    final residentsBloc = context.read<LocationResidentsBloc>();

    final color = AppColorScheme.of(context);
    final padding = MediaQuery.paddingOf(context);

    final maxHeight = 200.0 + padding.top;
    final minHeight = 50.0 + padding.top;

    return Scaffold(
      body: BlocConsumer<LocationDetailBloc, LocationDetailState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (location) => residentsBloc.add(
              LocationResidentsEvent.started(location.residentUrls),
            ),
            orElse: () {},
          );
        },
        builder: (context, state) => state.maybeWhen(
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
                  physics: ClampingScrollPhysics(),
                  slivers: [
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: SliverProgressHeaderDelegate(
                        maxExtent: maxHeight,
                        minExtent: minHeight,
                        builder: (context, progress) =>
                            LocationDetailPageHeader(
                              location,
                              progress: progress,
                            ),
                      ),
                    ),

                    DecoratedSliver(
                      decoration: BoxDecoration(color: color.background),
                      sliver: SliverPadding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        sliver: SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                location.name,
                                style: AppTextStyles.s24w700(color.textPrimary),
                              ),

                              SizedBox(height: 5),

                              Text(
                                location.dimension,
                                style: AppTextStyles.s15w500(
                                  color.textSecondary,
                                ),
                              ),

                              SizedBox(height: 30),

                              Text(
                                'Это планета, на которой проживает человеческая раса, и главное место для персонажей Рика и Морти. Возраст этой Земли более 4,6 миллиардов лет, и она является четвертой планетой от своей звезды.',
                                style: AppTextStyles.s15w500(color.textPrimary),
                              ),

                              SizedBox(height: 30),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Жители',
                                    style: AppTextStyles.s24w700(
                                      color.textPrimary,
                                    ),
                                  ),
                                  Text(
                                    'Все жители',
                                    style: AppTextStyles.s16w500(
                                      color.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    DecoratedSliver(
                      decoration: BoxDecoration(color: color.background),
                      sliver: SliverPadding(
                        padding: EdgeInsets.all(
                          16,
                        ).copyWith(bottom: padding.bottom),
                        sliver:
                            BlocBuilder<
                              LocationResidentsBloc,
                              LocationResidentsState
                            >(
                              builder: (context, state) => state.maybeWhen(
                                success: (characters) => SliverList.separated(
                                  itemCount: characters.length,
                                  separatorBuilder: (context, index) =>
                                      SizedBox(height: 24),
                                  itemBuilder: (context, index) => SizedBox(
                                    height: 74,
                                    child: CharacterListCard(characters[index]),
                                  ),
                                ),
                                error: (failure) => SliverFillRemaining(
                                  child: AppErrorStateWidget(),
                                ),
                                orElse: () => SliverFillRemaining(
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
          error: (failure) => AppErrorStateWidget(),
          orElse: () => AppLoadingStateWidget(),
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<LocationDetailBloc>()..add(LocationDetailEvent.started(id)),
        ),
        BlocProvider(create: (context) => getIt<LocationResidentsBloc>()),
      ],
      child: this,
    );
  }
}
