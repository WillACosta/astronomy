import 'package:flutter/material.dart';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import 'package:astronomy/l10n/l10n.dart';

part 'localization_store.g.dart';

@singleton
class LocalizationStore = _LocalizationStoreBase with _$LocalizationStore;

abstract class _LocalizationStoreBase with Store {
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
}
