import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:open_file/open_file.dart';

import '../../domain/services/local_notification_service.dart';

@Singleton(as: LocalNotificationService)
class CLocalNotificationService implements LocalNotificationService {
  late FlutterLocalNotificationsPlugin notificationsPlugin;

  CLocalNotificationService() {
    _initialize();
  }

  _initialize() {
    notificationsPlugin = FlutterLocalNotificationsPlugin();

    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final iOS = IOSInitializationSettings();

    final initSettings = InitializationSettings(android: android, iOS: iOS);

    notificationsPlugin.initialize(
      initSettings,
      onSelectNotification: _onSelectNotification,
    );
  }

  Future<void> _onSelectNotification(String? json) async {
    var notificationObject;

    if (json != null) notificationObject = jsonDecode(json);

    if (notificationObject['isSuccess']) {
      OpenFile.open(notificationObject['filePath']);
    }
  }

  @override
  Future<void> showNotification({
    required Map<String, dynamic> downloadStatus,
  }) async {
    final android = AndroidNotificationDetails(
      'channel id',
      'channel name',
      'channel description',
      priority: Priority.high,
      importance: Importance.max,
    );

    final iOS = IOSNotificationDetails();
    final platform = NotificationDetails(android: android, iOS: iOS);
    final json = jsonEncode(downloadStatus);
    final isSuccess = downloadStatus['isSuccess'];

    await notificationsPlugin.show(
      0,
      isSuccess ? 'Success' : 'Failure',
      isSuccess
          ? 'Your Astronomic image has been downloaded successfully!'
          : 'There was an error while downloading your image.',
      platform,
      payload: json,
    );
  }
}
