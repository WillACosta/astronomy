// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsStore on _SettingsStoreBase, Store {
  final _$userPreferencesAtom =
      Atom(name: '_SettingsStoreBase.userPreferences');

  @override
  UserPreferences get userPreferences {
    _$userPreferencesAtom.reportRead();
    return super.userPreferences;
  }

  @override
  set userPreferences(UserPreferences value) {
    _$userPreferencesAtom.reportWrite(value, super.userPreferences, () {
      super.userPreferences = value;
    });
  }

  final _$_readPreferencesAsyncAction =
      AsyncAction('_SettingsStoreBase._readPreferences');

  @override
  Future _readPreferences() {
    return _$_readPreferencesAsyncAction.run(() => super._readPreferences());
  }

  @override
  String toString() {
    return '''
userPreferences: ${userPreferences}
    ''';
  }
}
