// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'showcase_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ShowCaseStore on _ShowCaseStoreBase, Store {
  final _$displayHomeShowcaseAtom =
      Atom(name: '_ShowCaseStoreBase.displayHomeShowcase');

  @override
  bool get displayHomeShowcase {
    _$displayHomeShowcaseAtom.reportRead();
    return super.displayHomeShowcase;
  }

  @override
  set displayHomeShowcase(bool value) {
    _$displayHomeShowcaseAtom.reportWrite(value, super.displayHomeShowcase, () {
      super.displayHomeShowcase = value;
    });
  }

  final _$displayGridShowcaseAtom =
      Atom(name: '_ShowCaseStoreBase.displayGridShowcase');

  @override
  bool get displayGridShowcase {
    _$displayGridShowcaseAtom.reportRead();
    return super.displayGridShowcase;
  }

  @override
  set displayGridShowcase(bool value) {
    _$displayGridShowcaseAtom.reportWrite(value, super.displayGridShowcase, () {
      super.displayGridShowcase = value;
    });
  }

  final _$displayGridDetailShowcaseAtom =
      Atom(name: '_ShowCaseStoreBase.displayGridDetailShowcase');

  @override
  bool get displayGridDetailShowcase {
    _$displayGridDetailShowcaseAtom.reportRead();
    return super.displayGridDetailShowcase;
  }

  @override
  set displayGridDetailShowcase(bool value) {
    _$displayGridDetailShowcaseAtom
        .reportWrite(value, super.displayGridDetailShowcase, () {
      super.displayGridDetailShowcase = value;
    });
  }

  final _$_readPreferencesAsyncAction =
      AsyncAction('_ShowCaseStoreBase._readPreferences');

  @override
  Future _readPreferences() {
    return _$_readPreferencesAsyncAction.run(() => super._readPreferences());
  }

  final _$_setDisplayShowcaseAsyncAction =
      AsyncAction('_ShowCaseStoreBase._setDisplayShowcase');

  @override
  Future _setDisplayShowcase() {
    return _$_setDisplayShowcaseAsyncAction
        .run(() => super._setDisplayShowcase());
  }

  final _$_ShowCaseStoreBaseActionController =
      ActionController(name: '_ShowCaseStoreBase');

  @override
  dynamic _setShowcaseValue(
      {required ShowcasePage showcasePage, bool value = false}) {
    final _$actionInfo = _$_ShowCaseStoreBaseActionController.startAction(
        name: '_ShowCaseStoreBase._setShowcaseValue');
    try {
      return super._setShowcaseValue(showcasePage: showcasePage, value: value);
    } finally {
      _$_ShowCaseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
displayHomeShowcase: ${displayHomeShowcase},
displayGridShowcase: ${displayGridShowcase},
displayGridDetailShowcase: ${displayGridDetailShowcase}
    ''';
  }
}
