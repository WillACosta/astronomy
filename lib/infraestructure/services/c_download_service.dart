import 'dart:io';

import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:injectable/injectable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:dio/dio.dart';

import '../../domain/services/download_service.dart';
import '../../core/exception/service_failure.dart';
import '../../core/types/types.dart';

@Injectable(as: DownloadService)
class CDownloadService implements DownloadService {
  Dio dio = Dio();

  @override
  DownloadServiceType downloadFile({
    required String fileUrl,
    void Function(int, int)? progressCallback,
  }) async {
    final dir = await _getDownloadDirectory();
    final isStoragePermissionGranted = await _requestPermissions();

    if (isStoragePermissionGranted) {
      try {
        DateTime date = DateTime.now();
        String savePath =
            "${dir.path}/apod-images/astronomy-image-${date.toString()}.jpg";

        await dio.download(
          fileUrl,
          savePath,
          onReceiveProgress: progressCallback,
        );

        var result = await ImageGallerySaver.saveFile(savePath);
        return Right(result);
      } catch (e) {
        return Left(ServiceFailure(message: 'Error downloading image'));
      }
    } else {
      return Left(
        DeniedPermissionFailure(
          message: 'We need your permission :(',
        ),
      );
    }
  }

  Future<dynamic> _getDownloadDirectory() async {
    if (Platform.isAndroid) {
      return await DownloadsPathProvider.downloadsDirectory;
    }

    // return await getApplicationDocumentsDirectory();
    return await getTemporaryDirectory();
  }

  Future<bool> _requestPermissions() async {
    var permission = await Permission.storage.request().isGranted;

    if (!permission) {
      await Permission.storage.request();
      permission = await Permission.storage.request().isGranted;
    }

    return permission;
  }
}
