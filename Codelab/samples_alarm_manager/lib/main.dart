import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'background_service.dart';
import 'notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize AlarmManager and the NotificationService
  await BackgroundService.initializeService();
  NotificationService notificationService = NotificationService();
  await notificationService.initialize();

  runApp(MyApp(notificationService: notificationService));
}

class MyApp extends StatelessWidget {
  final NotificationService notificationService;

  const MyApp({Key? key, required this.notificationService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(notificationService: notificationService),
    );
  }
}

class HomePage extends StatefulWidget {
  final NotificationService notificationService;

  const HomePage({Key? key, required this.notificationService}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Schedule a notification 10 seconds from now
  void _scheduleNotification() {
    final delay = Duration(seconds: 10);

    // Schedule the alarm using BackgroundService
    BackgroundService.scheduleAlarm(0, delay);

    print('Notification scheduled in 10 seconds');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Background Service Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: _scheduleNotification,
          child: Text('Schedule Notification'),
        ),
      ),
    );
  }
}
