// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$stateAtom = Atom(name: '_HomeStoreBase.state');

  @override
  HomeState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(HomeState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$isMediaLoadedAtom = Atom(name: '_HomeStoreBase.isMediaLoaded');

  @override
  bool get isMediaLoaded {
    _$isMediaLoadedAtom.reportRead();
    return super.isMediaLoaded;
  }

  @override
  set isMediaLoaded(bool value) {
    _$isMediaLoadedAtom.reportWrite(value, super.isMediaLoaded, () {
      super.isMediaLoaded = value;
    });
  }

  final _$getMediaAsyncAction = AsyncAction('_HomeStoreBase.getMedia');

  @override
  Future getMedia() {
    return _$getMediaAsyncAction.run(() => super.getMedia());
  }

  final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase');

  @override
  dynamic setState(HomeState value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
isMediaLoaded: ${isMediaLoaded}
    ''';
  }
}
