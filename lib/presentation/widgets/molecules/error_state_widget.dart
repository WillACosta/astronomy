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
            width: 250,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              AppLocalizations.of(context)!.errorMessage,
              style: AppTextStyles.head(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              AppLocalizations.of(context)!.refreshMessage,
              style: AppTextStyles.body(),
            ),
          ),
        ],
      ),
    );
  }
}