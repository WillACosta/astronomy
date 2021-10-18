import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../utils/utils.dart';

class FavoritesEmptyState extends StatelessWidget {
  const FavoritesEmptyState({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Column(
        children: [
          const Spacer(),
          Text(
            AppLocalizations.of(context)!.noFavorites,
            style: AppTextStyles.bodyHead(color: Theme.of(context).accentColor),
            semanticsLabel: 'No favorites text',
          ),
          SizedBox(height: getProportionateScreenHeight(5)),
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
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
