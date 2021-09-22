import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../domain/usecases/showcase/showcase_usecase.dart';
import '../../domain/adapters/showcase.dart';

part 'showcase_store.g.dart';

@singleton
class ShowCaseStore = _ShowCaseStoreBase with _$ShowCaseStore;

abstract class _ShowCaseStoreBase with Store {
  final ShowcaseUseCase _usecase;

  @observable
  bool displayShowCase = false;

  _ShowCaseStoreBase(this._usecase) {
    _init();
  }

  @action
  _readPreferences() async {
    var isShowCase = await _usecase.readShowcase();
    displayShowCase = isShowCase.displayShowCase;
  }

  void _init() async {
    await _readPreferences();
  }

  @action
  setDisplayShowcase({required bool display}) async {
    displayShowCase = display;

    var showcaseValue = Showcase(displayShowCase: display);
    await _usecase.setShowcase(showcase: showcaseValue);
  }
}
