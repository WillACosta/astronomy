import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import 'package:astronomy/domain/usecases/settings/settings_usecase.dart';
import 'package:astronomy/domain/adapters/user_preferences.dart';
import 'package:astronomy/domain/adapters/user_locale.dart';

part 'settings_store.g.dart';

@singleton
class SettingsStore = _SettingsStoreBase with _$SettingsStore;

abstract class _SettingsStoreBase with Store {
  final SettingsUseCase _usecase;

  _SettingsStoreBase(this._usecase) {
    _init();
  }

  @observable
  UserPreferences userPreferences = UserPreferences(
    useDarkMode: false,
    useHdImages: false,
    userLocale: null,
  );

  @action
  _readPreferences() async {
    userPreferences = await _usecase.getUserPreferences();
  }

  void _init() async {
    await _initPreferences();
    await _readPreferences();
  }

  Future<void> _initPreferences() async {
    await Hive.openBox<UserPreferences>('user_preferences');
  }

  void setPreferences({
    required bool useDarkMode,
    required bool useHdImages,
    required dynamic currentLocale,
  }) async {
    final userLocale = UserLocale(
      languageCode: currentLocale.languageCode,
      countryCode: currentLocale.countryCode,
      scriptCode: currentLocale.scriptCode,
    );

    final prefs = UserPreferences(
      useDarkMode: useDarkMode,
      useHdImages: useHdImages,
      userLocale: userLocale,
    );

    await _usecase.setUserPreferences(userPreferences: prefs);
    _readPreferences();
  }
}
