import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:astronomy/external/dependency_injection/locator.dart';
import 'package:injectable/injectable.dart';
import 'package:open_file/open_file.dart';

import '../../application/localization/localization_store.dart';
import '../../domain/services/local_notification_service.dart';

@Singleton(as: LocalNotificationService)
class CLocalNotificationService implements LocalNotificationService {
  late FlutterLocalNotificationsPlugin notificationsPlugin;

  static final _localizationStore = locator<LocalizationStore>();

  CLocalNotificationService() {
    _initialize();
  }

  _initialize() {
    notificationsPlugin = FlutterLocalNotificationsPlugin();

    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOS = IOSInitializationSettings();

    const initSettings = InitializationSettings(android: android, iOS: iOS);

    notificationsPlugin.initialize(
      initSettings,
      onSelectNotification: _onSelectNotification,
    );
  }

  Future<void> _onSelectNotification(String? json) async {
    dynamic notificationObject;

    if (json != null) notificationObject = jsonDecode(json);

    if (notificationObject['isSuccess']) {
      OpenFile.open(notificationObject['filePath']);
    }
  }

  @override
  Future<void> showNotification({
    required Map<String, dynamic> downloadStatus,
  }) async {
    const android = AndroidNotificationDetails(
      'channel id',
      'channel name',
      'channel description',
      priority: Priority.high,
      importance: Importance.max,
    );

    const iOS = IOSNotificationDetails();
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

    await notificationsPlugin.show(
      0,
      isSuccess ? successMessage : failureMessage,
      isSuccess ? contentMessage : errorMessage,
      platform,
      payload: json,
    );
  }
}
