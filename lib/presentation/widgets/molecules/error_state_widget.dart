import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../utils/utils.dart' show AppImages, AppTextStyles;

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.errorIllustration,
            width: 230,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              AppLocalizations.of(context)!.errorMessage,
              style: AppTextStyles.body(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              AppLocalizations.of(context)!.refreshMessage,
              style: AppTextStyles.bodySmall(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
