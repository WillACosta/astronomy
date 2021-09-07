import 'package:astronomy/domain/services/translator_service.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../l10n/l10n.dart';

part 'localization_store.g.dart';

@singleton
class LocalizationStore = _LocalizationStoreBase with _$LocalizationStore;

abstract class _LocalizationStoreBase with Store {
  final TranslatorService _translatorService;

  _LocalizationStoreBase(this._translatorService);

  @observable
  Locale? locale;

  @action
  void setLocale(Locale currentLocale) {
    if (!L10n.all.contains(currentLocale)) return;

    locale = currentLocale;
  }

  @action
  void clearLocale() {
    locale = null;
  }

  @observable
  String translation = '';

  @action
  Future<void> translate(String text) async {
    var result = await _translatorService.translateFromTo(text: text);
    translation = result;
  }
}
