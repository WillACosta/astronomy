import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../domain/usecases/home/home_usecase.dart';
import 'home_state.dart';

part 'home_store.g.dart';

@Injectable()
class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final HomeUseCase _usecase;

  _HomeStoreBase(this._usecase) {
    getMedia();
  }

  @observable
  HomeState state = InitialState();

  @observable
  bool isMediaLoaded = false;

  @action
  setState(HomeState value) => state = value;

  @action
  getMedia() async {
    if (isMediaLoaded) return;

    setState(LoadingState());

    final result = await _usecase.getMediaOfTheDay();

    result.fold(
      (error) => setState(
        ErrorState(error),
      ),
      (result) {
        setState(SuccessState(result));
        /// Traduzir a media aqui
        isMediaLoaded = true;
      },
    );
  }

  Future refresh() async {
    await getMedia();
  }
}
