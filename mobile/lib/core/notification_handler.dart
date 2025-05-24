import 'dart:math';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHandler {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static const String channelId = "normal_channel_id";
  static const String channelName = "Normal Channel";
  static const String channelDescription = "";

  // Define Android notification details
  final AndroidNotificationDetails _androidNotificationDetails =
  const AndroidNotificationDetails(
    channelId,
    channelName,
    channelDescription: channelDescription,
    importance: Importance.high,
    playSound: true,
    enableVibration: true,
  );

  // Create a notification channel for Android
  final AndroidNotificationChannel androidNotificationChannel =
  const AndroidNotificationChannel(
    channelId,
    channelName,
    description: channelDescription,
    importance: Importance.high,
    playSound: true,
    enableVibration: true,
  );

  // Initialize notifications
  Future<void> initializeNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings("@mipmap/ic_launcher");

    const InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);

    try {
      // Create the notification channel
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(androidNotificationChannel);

      // Initialize the notification plugin
      await flutterLocalNotificationsPlugin.initialize(initializationSettings);

      print("Notification Initialized Successfully!");
    } catch (error) {
      print("Error initializing notifications: $error");
    }
  }

  // Show a normal notification
  Future showNormalNotification(notificationContent) async {
    int randomId = Random().nextInt(1000);
    await flutterLocalNotificationsPlugin.show(
      randomId,
      "Advice $randomId",
      "$notificationContent: $randomId",
      NotificationDetails(android: _androidNotificationDetails,),
    );
  }
}