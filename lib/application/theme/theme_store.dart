import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'theme_store.g.dart';

class ThemeStore = _ThemeStoreBase with _$ThemeStore;

abstract class _ThemeStoreBase with Store {
  bool isLightTheme = false;

  @observable
  ThemeData themeDataType = ThemeData.dark();

  @computed
  bool get isDark => themeDataType.brightness == Brightness.dark;

  @action
  void changeTheme() {
    if (isDark) {
      themeDataType = ThemeData.light();
    } else {
      themeDataType = ThemeData.dark();
    }
  }
}
