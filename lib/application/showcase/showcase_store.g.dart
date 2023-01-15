// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'showcase_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ShowCaseStore on _ShowCaseStoreBase, Store {
  late final _$displayHomeShowcaseAtom =
      Atom(name: '_ShowCaseStoreBase.displayHomeShowcase', context: context);

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

  late final _$displayGridShowcaseAtom =
      Atom(name: '_ShowCaseStoreBase.displayGridShowcase', context: context);

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

  late final _$displayGridDetailShowcaseAtom = Atom(
      name: '_ShowCaseStoreBase.displayGridDetailShowcase', context: context);

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

  late final _$_readPreferencesAsyncAction =
      AsyncAction('_ShowCaseStoreBase._readPreferences', context: context);

  @override
  Future _readPreferences() {
    return _$_readPreferencesAsyncAction.run(() => super._readPreferences());
  }

  late final _$_setDisplayShowcaseAsyncAction =
      AsyncAction('_ShowCaseStoreBase._setDisplayShowcase', context: context);

  @override
  Future _setDisplayShowcase() {
    return _$_setDisplayShowcaseAsyncAction
        .run(() => super._setDisplayShowcase());
  }

  late final _$_ShowCaseStoreBaseActionController =
      ActionController(name: '_ShowCaseStoreBase', context: context);

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
