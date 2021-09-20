import 'package:astronomy/application/localization/localization_store.dart';
import 'package:astronomy/external/dependency_injection/locator.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/services/download_service.dart';
import 'flutter_toast.dart';

part 'shared_store.g.dart';

@Injectable()
class SharedStore = _SharedStoreBase with _$SharedStore;

abstract class _SharedStoreBase with Store {
  final DownloadService _downloadService;

  _SharedStoreBase(this._downloadService);

  @observable
  bool isDownloadingImage = false;

  static final _localizationStore = locator<LocalizationStore>();

  final dateFormat = DateFormat(
    'yMd',
    _localizationStore.locale?.languageCode == 'pt' ? 'pt_BR' : 'en_US',
  );

  @action
  Future<void> downloadImage({required String url}) async {
    isDownloadingImage = true;
    final errorOrResult = await _downloadService.downloadFile(fileUrl: url);

    errorOrResult.fold((l) {
      isDownloadingImage = false;
      FlutterToast().showToast(message: l.message, kind: 'error');
    }, (r) {
      isDownloadingImage = false;
    });
  }

  void launchUrl(String url) async => await canLaunch(url)
      ? await launch(url)
      : FlutterToast().showToast(
          message:
              'Ops! Something went wrong with this link, please try again.',
          kind: 'error',
        );
}
