import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../domain/services/download_service.dart';

part 'shared_store.g.dart';

@Injectable()
class SharedStore = _SharedStoreBase with _$SharedStore;

abstract class _SharedStoreBase with Store {
  final DownloadService _downloadService;

  _SharedStoreBase(this._downloadService);

  @observable
  bool isDownloadingImage = false;

  @action
  Future<void> downloadImage({required String url}) async {
    isDownloadingImage = true;
    final errorOrResult = await _downloadService.downloadFile(fileUrl: url);

    errorOrResult.fold(
      (l) {
        isDownloadingImage = false;
      },
      (r) => isDownloadingImage = false,
    );
  }
}
