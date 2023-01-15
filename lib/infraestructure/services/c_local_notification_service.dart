import 'dart:convert';

import 'package:astronomy/application/localization/localization_store.dart';
import 'package:astronomy/domain/services/local_notification_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:open_file/open_file.dart';

@Injectable(as: LocalNotificationService)
class CLocalNotificationService implements LocalNotificationService {
  final LocalizationStore _localizationStore;
  late FlutterLocalNotificationsPlugin _localNotificationsPlugin;

  CLocalNotificationService(this._localizationStore) {
    _localNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _setUp();
  }

  @override
  Future<void> showNotification({
    required Map<String, dynamic> downloadStatus,
  }) async {
    const android = AndroidNotificationDetails(
      'channel id',
      'channel name',
      priority: Priority.high,
      importance: Importance.max,
    );

    const iOS = DarwinNotificationDetails();
    const platform = NotificationDetails(android: android, iOS: iOS);
    final json = jsonEncode(downloadStatus);
    final isSuccess = downloadStatus['isSuccess'];

    String successMessage = _localizationStore.locale?.languageCode == 'pt'
        ? 'Tudo certo'
        : 'Success';

    String failureMessage =
        _localizationStore.locale?.languageCode == 'pt' ? 'Oops' : 'Failure';

    String contentMessage = _localizationStore.locale?.languageCode == 'pt'
        ? 'Sua imagem foi baixada com sucesso!'
        : 'Your image has been downloaded successfully!';

    String errorMessage = _localizationStore.locale?.languageCode == 'pt'
        ? 'Aconteceu um erro ao baixar sua imagem.'
        : 'There was an error while downloading your image.';

    await _localNotificationsPlugin.show(
      0,
      isSuccess ? successMessage : failureMessage,
      isSuccess ? contentMessage : errorMessage,
      platform,
      payload: json,
    );
  }

  Future<void> _setUp() async {
    const androidSetting = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSetting = DarwinInitializationSettings();

    const initSettings = InitializationSettings(
      android: androidSetting,
      iOS: iosSetting,
    );

    await _localNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onReceivedNotification,
    );
  }

  Future<void> _onReceivedNotification(NotificationResponse response) async {
    dynamic notificationObject;

    if (notificationObject != null) {
      notificationObject = jsonDecode(notificationObject);
    }

    if (notificationObject['isSuccess']) {
      OpenFile.open(notificationObject['filePath']);
    }
  }
}
