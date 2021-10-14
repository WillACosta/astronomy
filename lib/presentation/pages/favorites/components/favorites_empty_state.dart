import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../utils/utils.dart';

class FavoritesEmptyState extends StatelessWidget {
  const FavoritesEmptyState({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          AppLocalizations.of(context)!.noFavorites,
          style: AppTextStyles.body(color: AppColors.accent),
          semanticsLabel: 'No favorites text',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: Text(
                AppLocalizations.of(context)!.noFavoritesContent,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodySmall(color: AppColors.accent),
              ),
            ),
            const Icon(
              Icons.bookmark_add_outlined,
              color: AppColors.accent,
              semanticLabel: 'Bookmark favorite icon',
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
