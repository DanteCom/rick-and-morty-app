import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:rick_and_morty/app/router/app_router.gr.dart';
import 'package:rick_and_morty/app/theme/app_color_scheme.dart';
import 'package:rick_and_morty/app/theme/app_text_styles.dart';
import 'package:rick_and_morty/core/extensions/string_extension.dart';
import 'package:rick_and_morty/features/character/domain/entities/character.dart';
import 'package:rick_and_morty/shared/widgets/app_image.dart';

class CharacterGridCard extends StatelessWidget {
  const CharacterGridCard(this.character, {super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);
    return CupertinoButton(
      onPressed: () =>
          context.pushRoute(CharacterDetailRoute(id: character.id)),
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Container(
            height: 120,
            width: 120,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: AppImage.network(character.image, fit: BoxFit.cover),
          ),
          const SizedBox(height: 18),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  character.status.name.capitalize(),
                  style: AppTextStyles.s12w400(const Color(0xFF43D049)),
                ),
                Text(
                  character.name,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.s15w500(color.textPrimary),
                ),
                Text(
                  '${character.species}, ${character.gender.name}',
                  style: AppTextStyles.s12w400(color.textSecondary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
