// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'container_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContainerPageStore on _ContainerPageStoreBase, Store {
  Computed<dynamic>? _$currentPageComputed;

  @override
  dynamic get currentPage =>
      (_$currentPageComputed ??= Computed<dynamic>(() => super.currentPage,
              name: '_ContainerPageStoreBase.currentPage'))
          .value;

  final _$_currentPageAtom = Atom(name: '_ContainerPageStoreBase._currentPage');

  @override
  int get _currentPage {
    _$_currentPageAtom.reportRead();
    return super._currentPage;
  }

  @override
  set _currentPage(int value) {
    _$_currentPageAtom.reportWrite(value, super._currentPage, () {
      super._currentPage = value;
    });
  }

  final _$_ContainerPageStoreBaseActionController =
      ActionController(name: '_ContainerPageStoreBase');

  @override
  void setCurrentPage(int value) {
    final _$actionInfo = _$_ContainerPageStoreBaseActionController.startAction(
        name: '_ContainerPageStoreBase.setCurrentPage');
    try {
      return super.setCurrentPage(value);
    } finally {
      _$_ContainerPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage}
    ''';
  }
}
