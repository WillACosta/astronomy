import '../../core/types/types.dart';

abstract class DownloadService {
  DownloadServiceType downloadFile({
    required String fileUrl,
    void Function(int, int)? progressCallback,
  });
}
