// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grid_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GridPageStore on _GridPageStoreBase, Store {
  Computed<String>? _$getDateRangeLabelComputed;

  @override
  String get getDateRangeLabel => (_$getDateRangeLabelComputed ??=
          Computed<String>(() => super.getDateRangeLabel,
              name: '_GridPageStoreBase.getDateRangeLabel'))
      .value;

  final _$stateAtom = Atom(name: '_GridPageStoreBase.state');

  @override
  GridPageState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(GridPageState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$mediaListAtom = Atom(name: '_GridPageStoreBase.mediaList');

  @override
  List<Media> get mediaList {
    _$mediaListAtom.reportRead();
    return super.mediaList;
  }

  @override
  set mediaList(List<Media> value) {
    _$mediaListAtom.reportWrite(value, super.mediaList, () {
      super.mediaList = value;
    });
  }

  final _$_dateTimeRangeAtom = Atom(name: '_GridPageStoreBase._dateTimeRange');

  @override
  DateTimeRange get _dateTimeRange {
    _$_dateTimeRangeAtom.reportRead();
    return super._dateTimeRange;
  }

  @override
  set _dateTimeRange(DateTimeRange value) {
    _$_dateTimeRangeAtom.reportWrite(value, super._dateTimeRange, () {
      super._dateTimeRange = value;
    });
  }

  final _$getMediaListAsyncAction =
      AsyncAction('_GridPageStoreBase.getMediaList');

  @override
  Future getMediaList() {
    return _$getMediaListAsyncAction.run(() => super.getMediaList());
  }

  final _$_GridPageStoreBaseActionController =
      ActionController(name: '_GridPageStoreBase');

  @override
  void setDateRange(DateTimeRange value) {
    final _$actionInfo = _$_GridPageStoreBaseActionController.startAction(
        name: '_GridPageStoreBase.setDateRange');
    try {
      return super.setDateRange(value);
    } finally {
      _$_GridPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setState(GridPageState value) {
    final _$actionInfo = _$_GridPageStoreBaseActionController.startAction(
        name: '_GridPageStoreBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$_GridPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
mediaList: ${mediaList},
getDateRangeLabel: ${getDateRangeLabel}
    ''';
  }
}
