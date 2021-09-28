import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../domain/usecases/showcase/showcase_usecase.dart';
import '../../domain/adapters/showcase.dart';

part 'showcase_store.g.dart';

enum ShowcasePage { home, grid, gridDetail }

@singleton
class ShowCaseStore = _ShowCaseStoreBase with _$ShowCaseStore;

abstract class _ShowCaseStoreBase with Store {
  final ShowcaseUseCase _usecase;

  @observable
  bool displayHomeShowcase = false;

  @observable
  bool displayGridShowcase = false;

  @observable
  bool displayGridDetailShowcase = false;

  _ShowCaseStoreBase(this._usecase) {
    _init();
  }

  void _init() async {
    await _readPreferences();
  }

  @action
  _readPreferences() async {
    var isShowCase = await _usecase.readShowcase();

    displayHomeShowcase = isShowCase.displayHomeShowcase;
    displayGridShowcase = isShowCase.displayGridShowcase;
    displayGridDetailShowcase = isShowCase.displayGridDetailShowcase;
  }

  @action
  _setDisplayShowcase() async {
    var showcaseValue = Showcase(
      displayHomeShowcase: displayHomeShowcase,
      displayGridShowcase: displayGridShowcase,
      displayGridDetailShowcase: displayGridDetailShowcase,
    );

    await _usecase.setShowcase(showcase: showcaseValue);
  }

  @action
  _setShowcaseValue({required ShowcasePage showcasePage, bool value = false}) {
    if (showcasePage == ShowcasePage.home) {
      displayHomeShowcase = value;
    }

    if (showcasePage == ShowcasePage.grid) {
      displayGridShowcase = value;
    }

    if (showcasePage == ShowcasePage.gridDetail) {
      displayGridDetailShowcase = value;
    }
  }

  void closeShowCase({required ShowcasePage showcasePage}) {
    _setShowcaseValue(showcasePage: showcasePage);
    _setDisplayShowcase();
  }
}
