import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:rick_and_morty/app/router/app_router.gr.dart';
import 'package:rick_and_morty/app/theme/app_color_scheme.dart';
import 'package:rick_and_morty/app/theme/app_text_styles.dart';
import 'package:rick_and_morty/core/extensions/string_extension.dart';
import 'package:rick_and_morty/features/character/domain/entities/character.dart';
import 'package:rick_and_morty/shared/widgets/app_image.dart';

class CharacterListCard extends StatelessWidget {
  final Character character;
  const CharacterListCard(this.character, {super.key});

  @override
  Widget build(BuildContext context) {
    final color = AppColorScheme.of(context);

    return CupertinoButton(
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
        ],
      ),
    );
  }
}
