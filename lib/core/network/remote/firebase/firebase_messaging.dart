/*
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:yusur/features/layout/layout_screen.dart';
import '../../../../main.dart';
import '../../../utils/app_navigation.dart';
import '../../local/cache/chace_helper.dart';
import '../../local/notifications/local_notifications.dart';

/// BACKGROUND HANDLER NOTIFICATION
Future backgroundHandler(RemoteMessage message) async {
  debugPrint('back ground message = ${message.notification?.title}');
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (navigatorKey.currentState?.context != null) {
      // LayoutScreen.index=3;
      AppNavigator.push(
        screen: LayoutScreen(),
        context: navigatorKey.currentState!.context,
      );
    }
  });
}

class FirebaseNotifications {
  /// OBJECT FROM FCM
  static final FirebaseMessaging messaging = FirebaseMessaging.instance;

  /// GET FCM NOTIFICATION TOKEN AND SAVE IT AN CACHE
  static Future getFcmToken() async {
    /// GET AND SAVE FCM NOTIFICATION TOKEN IN CACHE
    if (Platform.isIOS) {
      await Future.delayed(const Duration(seconds: 3));
      await FirebaseMessaging.instance.getAPNSToken();
    }

    await messaging.getToken().then((token) async {
      if (!CacheHelper.sharedPreferences.containsKey('fcm_token')) {
        await CacheHelper.saveData('fcm_token', token);
      }
      debugPrint('fcm_token $token');
    });
  }

  static Future init() async {
    /// REQUEST PERMISSION
    await requestNotificationPermission();

    /// HANDLING WHEN APPLICATION IN BACKGROUND
    FirebaseMessaging.onBackgroundMessage(
      backgroundHandler,
    );

    await LocalNotificationService.initialize();

    /// GET FCM TOKEN
    await getFcmToken();

    await messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    /// WHEN APP IS KILL [CLOSED]
    await messaging.getInitialMessage().then(
      (RemoteMessage? message) async {
        if (message != null) {
          backgroundHandler(message);
        }
      },
    );

    /// NOTIFICATION WHEN APPLICATION IN [BACKGROUND]
    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) async {
        if (message.notification != null) {
          backgroundHandler(message);
        }
      },
    );

    /// NOTIFICATION WHEN APPLICATION IN [FOREGROUND]
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) async {
        if (message.notification != null) {
          await LocalNotificationService.createNotification(message);
        }
      },
    );
  }

  static Future<void> requestNotificationPermission() async {
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      sound: true,
    );
  }
}
*/
