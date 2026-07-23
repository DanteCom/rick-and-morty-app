import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:rick_and_morty/app/router/app_router.gr.dart';
import 'package:rick_and_morty/app/theme/app_color_scheme.dart';
import 'package:rick_and_morty/app/theme/app_text_styles.dart';
import 'package:rick_and_morty/shared/resources/resources.dart';
import 'package:rick_and_morty/shared/widgets/app_svg_picture.dart';

@RoutePage()
class AppShellPage extends StatelessWidget {
  const AppShellPage({super.key});

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);

    return AutoTabsRouter(
      routes: [CharactersRoute(), LocationsRoute(), EpisodesRoute()],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        bool isActive(int index) => index == tabsRouter.activeIndex;

        return Scaffold(
          body: child,
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: color.surface,
              boxShadow: [
                BoxShadow(
                  blurRadius: 30,
                  offset: Offset(0, -4),
                  color: Color(0xFF000000).withAlpha(80),
                ),
              ],
            ),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _Tab(
                          icon: Svgs.character,
                          title: 'Home',
                          isActive: isActive(0),
                          onPressed: () => tabsRouter.setActiveIndex(0),
                        ),
                      ),
                      Expanded(
                        child: _Tab(
                          icon: Svgs.planet,
                          title: 'Home',
                          isActive: isActive(1),
                          onPressed: () => tabsRouter.setActiveIndex(1),
                        ),
                      ),
                      Expanded(
                        child: _Tab(
                          icon: Svgs.tv,
                          title: 'Home',
                          isActive: isActive(2),
                          onPressed: () => tabsRouter.setActiveIndex(2),
                        ),
                      ),
                      Expanded(
                        child: _Tab(
                          icon: Svgs.settings,
                          title: 'Settings',
                          isActive: isActive(3),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Tab extends StatelessWidget {
  final String icon;
  final String title;
  final bool isActive;
  final VoidCallback onPressed;

  const _Tab({
    required this.icon,
    required this.title,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);

    return CupertinoButton(
      onPressed: isActive ? null : onPressed,
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          AppSvgPicture(
            icon,
            color: isActive ? color.primary : color.textSecondary,
          ),
          SizedBox(height: 3),
          Text(
            'Home',
            style: AppTextStyles.s12w400(
              isActive ? color.primary : color.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
