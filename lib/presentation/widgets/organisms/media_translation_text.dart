import 'package:flutter/material.dart';

import '../../../application/localization/localization_store.dart';
import '../../../application/translator/translator_store.dart';
import '../../../external/dependency_injection/locator.dart';
import '../widgets.dart';

class MediaTranslationText extends StatelessWidget {
  const MediaTranslationText({
    Key? key,
    required this.isTitleShimmerTile,
    required this.englishTextChild,
    required this.textToTranslate,
  }) : super(key: key);

  final Widget englishTextChild;
  final String textToTranslate;
  final bool isTitleShimmerTile;

  static final _translatorStore = locator<TranslatorStore>();
  static final _localizationStore = locator<LocalizationStore>();

  @override
  Widget build(BuildContext context) {
    return _localizationStore.locale?.languageCode == 'pt'
        ? TranslatorFutureBuilder(
            isTitleShimmerTile: isTitleShimmerTile,
            englishTextChild: englishTextChild,
            futureFunction: _translatorStore.translate(textToTranslate),
          )
        : englishTextChild;
  }
}
