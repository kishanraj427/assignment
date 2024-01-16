import 'dart:convert';

import 'package:assignment/screens/noti_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class FirebaseAPI {
  final firebaseMessaging = FirebaseMessaging.instance;
  final androidChannel = const AndroidNotificationChannel(
      "high_importance_channel", "High Importance Notifications",
      description: "This Channel is used for important notifications",
      importance: Importance.defaultImportance);
  final localNotification = FlutterLocalNotificationsPlugin();

  Future<void> initNotifications() async {
    await firebaseMessaging.requestPermission();
    String? fcmToken = await firebaseMessaging.getToken();

    // cpVBjESVQmS9ernPX32Dol:APA91bHuZScVosQlPJ1e65ZD2njll1Uw59VHqCV39VMFGym8-8PnMWLTqyVloXNhrk5TMFIVw26zFkCTryPxEQWEepiDVk9vsv9Sx9MBu63wLYcscQdR5WJOobWBIh8RYj8RvJvXbXFv

    initPushNotification();
    initLocalNotification();
  }

  void handleMessage(RemoteMessage message) {
    if (message == null)
      return;
    else {
      Get.to(NotiPage(
          text: message.notification!.title! + "\n" + message.data.toString()));
    }
  }

  Future initPushNotification() async {
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((value) => handleMessage(value!));

    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

    FirebaseMessaging.onBackgroundMessage(
        (message) => handleBackgroundMessage(message));

    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;
      localNotification.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
              android: AndroidNotificationDetails(
            androidChannel.id,
            androidChannel.name,
            channelDescription: androidChannel.description,
            icon: "@drawable/ic_launcher",
          )),
          payload: jsonEncode(message.toMap()));
    });
  }

  Future initLocalNotification() async {
    const android = AndroidInitializationSettings("@drawable/ic_launcher");
    const ios = DarwinInitializationSettings();
    const settings = InitializationSettings(iOS: ios, android: android);
    await localNotification.initialize(
      settings,
      onDidReceiveNotificationResponse: (value) {
        final message = RemoteMessage.fromMap(jsonDecode(value.payload!));
        handleMessage(message);
      },
    );
    final platform = localNotification.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await platform!.createNotificationChannel(androidChannel);
  }

  Future<void> handleBackgroundMessage(RemoteMessage message) async {
    print("Title: ${message.notification!.title}");
    print("Message: ${message.notification!.body}");
    print("Payload: ${message.data}");
  }
}
