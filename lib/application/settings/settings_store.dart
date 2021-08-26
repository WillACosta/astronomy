import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../domain/usecases/settings/settings_usecase.dart';
import '../../domain/entities/user_preferences.dart';

part 'settings_store.g.dart';

@Injectable()
class SettingsStore = _SettingsStoreBase with _$SettingsStore;

abstract class _SettingsStoreBase with Store {
  final SettingsUseCase _usecase;

  _SettingsStoreBase(this._usecase) {
    _init();
  }

  @observable
  UserPreferences _userPreferences =
      UserPreferences(useDarkMode: false, useHdImages: false);

  @computed
  UserPreferences get userPreferences => _userPreferences;

  void _init() async {
    await _initPreferences();
    await _readPreferences();
  }

  Future<void> _initPreferences() async {
    await Hive.openBox<UserPreferences>('user_preferences');
  }

  @action
  _readPreferences() async {
    _userPreferences = await _usecase.getUserPreferences();
  }

  setPreferences({
    required bool isLightTheme,
    required bool useHdImages,
  }) async {
    final prefs = UserPreferences(
      useDarkMode: isLightTheme,
      useHdImages: useHdImages,
    );

    _usecase.setUserPreferences(userPreferences: prefs);
    _readPreferences();
  }
}
