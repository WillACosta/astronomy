// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStoreBase, Store {
  late final _$stateAtom = Atom(name: '_HomeStoreBase.state', context: context);

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

  late final _$isMediaLoadedAtom =
      Atom(name: '_HomeStoreBase.isMediaLoaded', context: context);

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

  late final _$getMediaAsyncAction =
      AsyncAction('_HomeStoreBase.getMedia', context: context);

  @override
  Future getMedia() {
    return _$getMediaAsyncAction.run(() => super.getMedia());
  }

  late final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase', context: context);

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
