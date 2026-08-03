import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/app/theme/app_color_scheme.dart';
import 'package:rick_and_morty/app/theme/app_text_styles.dart';
import 'package:rick_and_morty/core/di/injectable.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/features/location/domain/entities/location.dart';
import 'package:rick_and_morty/features/location/presentation/locations/bloc/locations/locations_bloc.dart';
import 'package:rick_and_morty/features/location/presentation/locations/bloc/locations_search/locations_search_bloc.dart';
import 'package:rick_and_morty/shared/resources/resources.dart';
import 'package:rick_and_morty/features/location/presentation/locations/widgets/header.dart';
import 'package:rick_and_morty/shared/widgets/app_error_state_widget.dart';
import 'package:rick_and_morty/shared/widgets/app_loading_state_widget.dart';

@RoutePage()
class LocationsPage extends StatefulWidget {
  const LocationsPage({super.key});

  @override
  State<LocationsPage> createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
  late final FocusNode _focusNode;
  late final ScrollController _scrollController;

  late final LocationsBloc _locationsBloc;
  late final LocationsSearchBloc _searchBloc;

  double _progress = 0.0;
  double get progress => _progress;

  double get minHeight => 55 + padding.top;
  double get maxHeight => 110 + padding.top;

  double get collapseRange => maxHeight - minHeight;

  EdgeInsets get padding => MediaQuery.paddingOf(context);

  @override
  void initState() {
    super.initState();
    _locationsBloc = getIt<LocationsBloc>()..add(LocationsEvent.started());
    _searchBloc = getIt<LocationsSearchBloc>();

    _scrollController = ScrollController(
      onAttach: (position) =>
          position.isScrollingNotifier.addListener(_onScrollChanged),
    );

    _focusNode = FocusNode();

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
  void dispose() {
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _locationsBloc),
        BlocProvider.value(value: _searchBloc),
      ],
      child: Scaffold(
        body: Column(
          children: [
            LocationsPageHeader(
              progress: _progress,
              maxHeight: maxHeight,
              minHeight: minHeight,
              focusNode: _focusNode,
              onChanged: (value) =>
                  _searchBloc.add(LocationsSearchEvent.search(value)),
              onSearchButton: _onSearchButton,
            ),
            Expanded(
              child: BlocBuilder<LocationsBloc, LocationsState>(
                builder: (context, state) => state.maybeWhen(
                  success: (response, loadMoreState) =>
                      BlocBuilder<LocationsSearchBloc, LocationsSearchState>(
                        builder: (context, state) => state.maybeWhen(
                          idle: () {
                            final locations = response.locations;

                            return NotificationListener<UserScrollNotification>(
                              onNotification: (notification) {
                                if (notification.direction ==
                                    ScrollDirection.idle) {
                                  final pixels = notification.metrics.pixels;
                                  final maxScrollExtent =
                                      notification.metrics.maxScrollExtent;

                                  if (pixels >= (maxScrollExtent - 200)) {
                                    final nextPageUrl = response.info.next;

                                    if (nextPageUrl != null) {
                                      _locationsBloc.add(
                                        LocationsEvent.loadMore(nextPageUrl),
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
                                    padding: EdgeInsets.all(16),
                                    sliver: SliverList.separated(
                                      itemCount: locations.length,
                                      separatorBuilder: (context, index) =>
                                          SizedBox(height: 24),
                                      itemBuilder: (context, index) =>
                                          LocationCard(locations[index]),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          success: (response) {
                            final locations = response.locations;

                            return CustomScrollView(
                              slivers: [
                                SliverPadding(
                                  padding: EdgeInsets.all(16),
                                  sliver: SliverList.separated(
                                    itemCount: locations.length,
                                    separatorBuilder: (context, index) =>
                                        SizedBox(height: 24),
                                    itemBuilder: (context, index) =>
                                        LocationCard(locations[index]),
                                  ),
                                ),
                              ],
                            );
                          },
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
                          orElse: () => AppLoadingStateWidget(),
                        ),
                      ),
                  error: (failure) => AppErrorStateWidget(),
                  orElse: () => AppLoadingStateWidget(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LocationCard extends StatelessWidget {
  final Location location;

  const LocationCard(this.location, {super.key});

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);

    return Container(
      height: 220,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: color.surface,
        borderRadius: BorderRadius.circular(20),
        border: color.brightness == Brightness.light
            ? Border.all(color: Color(0xFFE0E0E0))
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Image.asset(Images.park, fit: BoxFit.fill)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  location.name,
                  style: AppTextStyles.s16w500(color.textPrimary),
                ),

                Text(
                  location.dimension,
                  style: AppTextStyles.s16w500(color.textSecondary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
