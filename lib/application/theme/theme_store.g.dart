// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ThemeStore on _ThemeStoreBase, Store {
  Computed<bool>? _$isDarkComputed;

  @override
  bool get isDark => (_$isDarkComputed ??=
          Computed<bool>(() => super.isDark, name: '_ThemeStoreBase.isDark'))
      .value;

  final _$themeDataTypeAtom = Atom(name: '_ThemeStoreBase.themeDataType');

  @override
  ThemeData get themeDataType {
    _$themeDataTypeAtom.reportRead();
    return super.themeDataType;
  }

  @override
  set themeDataType(ThemeData value) {
    _$themeDataTypeAtom.reportWrite(value, super.themeDataType, () {
      super.themeDataType = value;
    });
  }

  final _$_ThemeStoreBaseActionController =
      ActionController(name: '_ThemeStoreBase');

  @override
  void changeTheme() {
    final _$actionInfo = _$_ThemeStoreBaseActionController.startAction(
        name: '_ThemeStoreBase.changeTheme');
    try {
      return super.changeTheme();
    } finally {
      _$_ThemeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
themeDataType: ${themeDataType},
isDark: ${isDark}
    ''';
  }
}
