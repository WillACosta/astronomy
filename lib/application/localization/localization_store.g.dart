// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LocalizationStore on _LocalizationStoreBase, Store {
  late final _$localeAtom =
      Atom(name: '_LocalizationStoreBase.locale', context: context);

  @override
  Locale? get locale {
    _$localeAtom.reportRead();
    return super.locale;
  }

  @override
  set locale(Locale? value) {
    _$localeAtom.reportWrite(value, super.locale, () {
      super.locale = value;
    });
  }

  late final _$_LocalizationStoreBaseActionController =
      ActionController(name: '_LocalizationStoreBase', context: context);

  @override
  void setLocale(Locale currentLocale) {
    final _$actionInfo = _$_LocalizationStoreBaseActionController.startAction(
        name: '_LocalizationStoreBase.setLocale');
    try {
      return super.setLocale(currentLocale);
    } finally {
      _$_LocalizationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearLocale() {
    final _$actionInfo = _$_LocalizationStoreBaseActionController.startAction(
        name: '_LocalizationStoreBase.clearLocale');
    try {
      return super.clearLocale();
    } finally {
      _$_LocalizationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
locale: ${locale}
    ''';
  }
}
