/*
import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:yusur/features/layout/layout_screen.dart';
import '../../../../main.dart';
import '../../../utils/app_navigation.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin notifications =
      FlutterLocalNotificationsPlugin();
  static Future initialize() async {
    await notifications.initialize(
   settings:   const InitializationSettings(
        iOS: DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
        ),
        android: AndroidInitializationSettings(
          '@mipmap/ic_launcher',
        ),
      ),
      onDidReceiveBackgroundNotificationResponse: onDidReceiveLocalNotification,
      onDidReceiveNotificationResponse: onDidReceiveLocalNotification,
    );
  }

  static void onDidReceiveLocalNotification(
    NotificationResponse notificationResponse,
  ) async {
    // LayoutScreen.index = 3;
    AppNavigator.push(
      screen: LayoutScreen(),
      context: navigatorKey.currentState!.context,
    );
  }

  static Future createNotification(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          'high_importance_channel',
          'High Importance Notifications',
          importance: Importance.max,
          priority: Priority.high,
        ),
      );

      if (Platform.isIOS) return;
      await notifications.show(
        id: id,
        title: message.notification!.title,
        body: message.notification!.body,
        notificationDetails: notificationDetails,
      );
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
*/
