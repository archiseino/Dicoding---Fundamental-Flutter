import 'dart:isolate';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';

import 'notification_service.dart';

class BackgroundService {
  static SendPort? uiSendPort;
  static const String isolateName = 'isolate';

  // Method to initialize the service
  static Future<void> initializeService() async {
    await AndroidAlarmManager.initialize();
  }

  // A static method to be triggered by AlarmManager
  static Future<void> notificationCallback() async {
    NotificationService notificationService = NotificationService();
    await notificationService.initialize();
    notificationService.showNotification(
      id: 1,
      title: "Alarm Notification",
      body: "This notification was triggered by AlarmManager.",
    );
  }

  // Method to schedule a notification using AlarmManager
  static Future<void> scheduleAlarm(int id, Duration delay) async {
    await AndroidAlarmManager.oneShot(
      delay,
      id,
      notificationCallback,
      exact: true,
      wakeup: true,
    );
  }
}
