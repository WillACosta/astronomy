import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'showcase_store.g.dart';

@singleton
class ShowCaseStore = _ShowCaseStoreBase with _$ShowCaseStore;

abstract class _ShowCaseStoreBase with Store {
  @observable
  bool displayShowCase = false;
}
