import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';

part 'container_page_store.g.dart';

@Injectable()
class ContainerPageStore = _ContainerPageStoreBase with _$ContainerPageStore;

abstract class _ContainerPageStoreBase with Store {
  @observable
  int _currentPage = 0;

  @action
  void setCurrentPage(int value) => _currentPage = value;

  @computed
  get currentPage => _currentPage;

  final pageController = PageController(initialPage: 0);

  void toPage(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 200),
      curve: Curves.ease,
    );
  }
}
