// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsStore on _SettingsStoreBase, Store {
  Computed<UserPreferences>? _$userPreferencesComputed;

  @override
  UserPreferences get userPreferences => (_$userPreferencesComputed ??=
          Computed<UserPreferences>(() => super.userPreferences,
              name: '_SettingsStoreBase.userPreferences'))
      .value;

  final _$_userPreferencesAtom =
      Atom(name: '_SettingsStoreBase._userPreferences');

  @override
  UserPreferences get _userPreferences {
    _$_userPreferencesAtom.reportRead();
    return super._userPreferences;
  }

  @override
  set _userPreferences(UserPreferences value) {
    _$_userPreferencesAtom.reportWrite(value, super._userPreferences, () {
      super._userPreferences = value;
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
