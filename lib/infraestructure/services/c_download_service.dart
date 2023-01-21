import 'dart:io';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:injectable/injectable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:dio/dio.dart';

import 'package:astronomy/domain/services/local_notification_service.dart';
import 'package:astronomy/domain/services/permissions_service.dart';
import 'package:astronomy/domain/services/download_service.dart';
import 'package:astronomy/core/exception/service_failure.dart';
import 'package:astronomy/core/types/types.dart';

@Injectable(as: DownloadService)
class CDownloadService implements DownloadService {
  Dio dio = Dio();

  final LocalNotificationService _localNotificationService;
  final PermissionsService _permissionsService;

  CDownloadService(
    this._localNotificationService,
    this._permissionsService,
  );

  @override
  DownloadServiceType downloadFile({
    required String fileUrl,
    void Function(int, int)? progressCallback,
  }) async {
    final dir = await _getDownloadDirectory();
    final isStoragePermissionGranted = await _permissionsService
        .requestPermission(type: PermissionsType.storage);

    final savePath = _concatSavePath(dir);

    if (isStoragePermissionGranted) {
      try {
        await dio.download(
          fileUrl,
          savePath,
          onReceiveProgress: progressCallback,
        );

        var result = await ImageGallerySaver.saveFile(savePath);

        _localNotificationService.showNotification(downloadStatus: {
          'isSuccess': true,
          'filePath': savePath,
        });

        return Right(result);
      } catch (e) {
        return Left(ServiceFailure(message: 'Sorry! Something went wrong.'));
      }
    } else {
      return Left(
        DeniedPermissionFailure(
          message: "Couldn't download the image! We need storage permissions.",
        ),
      );
    }
  }

  Future<Directory> _getDownloadDirectory() async {
    return await getTemporaryDirectory();
  }

  String _concatSavePath(Directory dir) {
    DateTime date = DateTime.now();
    return '${dir.path}/apod-images/astronomy-image-${date.toString()}.jpg';
  }
}
