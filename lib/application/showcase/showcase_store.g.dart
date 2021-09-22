// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'showcase_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ShowCaseStore on _ShowCaseStoreBase, Store {
  final _$displayShowCaseAtom =
      Atom(name: '_ShowCaseStoreBase.displayShowCase');

  @override
  bool get displayShowCase {
    _$displayShowCaseAtom.reportRead();
    return super.displayShowCase;
  }

  @override
  set displayShowCase(bool value) {
    _$displayShowCaseAtom.reportWrite(value, super.displayShowCase, () {
      super.displayShowCase = value;
    });
  }

  final _$_readPreferencesAsyncAction =
      AsyncAction('_ShowCaseStoreBase._readPreferences');

  @override
  Future _readPreferences() {
    return _$_readPreferencesAsyncAction.run(() => super._readPreferences());
  }

  final _$setDisplayShowcaseAsyncAction =
      AsyncAction('_ShowCaseStoreBase.setDisplayShowcase');

  @override
  Future setDisplayShowcase({required bool display}) {
    return _$setDisplayShowcaseAsyncAction
        .run(() => super.setDisplayShowcase(display: display));
  }

  @override
  String toString() {
    return '''
displayShowCase: ${displayShowCase}
    ''';
  }
}
