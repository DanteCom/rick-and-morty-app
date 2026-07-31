import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rick_and_morty/app/theme/app_text_styles.dart';
import 'package:rick_and_morty/core/di/injectable.dart';
import 'package:rick_and_morty/app/theme/app_color_scheme.dart';
import 'package:rick_and_morty/core/extensions/string_extension.dart';
import 'package:rick_and_morty/core/failure/app_failure.dart';
import 'package:rick_and_morty/features/characters/presentation/character_detail/bloc/character_detail/character_detail_bloc.dart';
import 'package:rick_and_morty/features/characters/presentation/character_detail/bloc/character_episodes/character_episodes_bloc.dart';
import 'package:rick_and_morty/features/characters/presentation/character_detail/widgets/header.dart';
import 'package:rick_and_morty/features/episodes/domain/episode.dart';
import 'package:rick_and_morty/shared/resources/resources.dart';
import 'package:rick_and_morty/shared/widgets/app_error_state_widget.dart';
import 'package:rick_and_morty/shared/widgets/app_loading_state_widget.dart';

@RoutePage()
class CharacterDetailPage extends StatefulWidget {
  final int id;
  const CharacterDetailPage(this.id, {super.key});

  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {
  double _progress = 0.0;

  late final CharacterDetailBloc _characterBloc;
  late final CharacterEpisodesBloc _episodesBloc;

  late final ScrollController _scrollController;

  double get progress => _progress;

  double get maxHeight => 400 + padding.top;
  double get minHeight => 50 + padding.top;

  double get collapseRange => maxHeight - minHeight;

  EdgeInsets get padding => MediaQuery.paddingOf(context);

  @override
  void initState() {
    super.initState();

    _characterBloc = getIt<CharacterDetailBloc>()
      ..add(CharacterDetailEvent.started(widget.id));
    _episodesBloc = getIt<CharacterEpisodesBloc>();

    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final pixels = _scrollController.position.pixels;
    final progress = (pixels / collapseRange).clamp(0.0, 1.0);

    if (progress == this.progress) return;

    setState(() => _progress = progress);
  }

  @override
  void dispose() {
    _characterBloc.close();
    _episodesBloc.close();

    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);
    final padding = MediaQuery.paddingOf(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _characterBloc),
        BlocProvider.value(value: _episodesBloc),
      ],
      child: Scaffold(
        body: BlocConsumer<CharacterDetailBloc, CharacterDetailState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (character) => _episodesBloc.add(
                CharacterEpisodesEvent.started(character.episodeUrls),
              ),
              orElse: () {},
            );
          },
          builder: (context, state) => state.maybeWhen(
            success: (character) => Column(
              children: [
                CharacterDetailPageHeader(
                  character,
                  maxHeight: maxHeight,
                  minHeight: minHeight,
                  progress: progress,
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    controller: _scrollController,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 36,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                      Container(
                        height: 3,
                        width: double.infinity,
                        color: color.onSurface,
                      ),
                      SizedBox(height: 36),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Эпизоды',
                                  style: AppTextStyles.s22w500(
                                    color.textPrimary,
                                  ),
                                ),
                                Text(
                                  'Все эпизоды',
                                  style: AppTextStyles.s16w500(
                                    color.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                            BlocBuilder<
                              CharacterEpisodesBloc,
                              CharacterEpisodesState
                            >(
                              builder: (context, state) => state.maybeWhen(
                                success: (episodes) {
                                  return ListView.separated(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.only(
                                      top: 24,
                                      bottom: 24 + padding.bottom,
                                    ),
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: episodes.length,
                                    separatorBuilder: (context, index) =>
                                        SizedBox(height: 24),
                                    itemBuilder: (context, index) =>
                                        EpisodeCard(episode: episodes[index]),
                                  );
                                },
                                loading: () => AppLoadingStateWidget(),
                                error: (failure) => AppErrorStateWidget(
                                  title: failure.maybeWhen(
                                    noConnection: () =>
                                        'Нет подключения к сети',
                                    requestLimit: () =>
                                        'Слишком много запросов',
                                    orElse: () => 'Упс! Что-то пошло не так',
                                  ),
                                ),
                                orElse: () => SizedBox(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            error: (failure) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: AppErrorStateWidget(
                title: failure.when(
                  noConnection: () => 'Нет подключения к сети',
                  requestLimit: () => 'Слишком много запросов',
                  notFound: () => 'Персонаж не найден',
                  unknown: () => 'Упс! Что-то пошло не так',
                ),
              ),
            ),
            orElse: () => AppLoadingStateWidget(),
          ),
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
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.s15w500(color.textSecondary)),
                SizedBox(height: 5),
                Text(label, style: AppTextStyles.s16w500(color.textPrimary)),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios_rounded, color: color.textPrimary),
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
        onPressed: () {},
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
            SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Серия ${episode.id}',
                      style: AppTextStyles.s12w400(Color(0xFF22A2BD)),
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
            Icon(Icons.arrow_forward_ios_rounded, color: color.textPrimary),
          ],
        ),
      ),
    );
  }
}
