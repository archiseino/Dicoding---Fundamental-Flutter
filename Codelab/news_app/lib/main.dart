import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:news_app/common/navigation.dart';
import 'package:news_app/data/api/api_service.dart';
import 'package:news_app/data/db/database_helper.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/data/preferences/preferences_helper.dart';
import 'package:news_app/provider/database_provider.dart';
import 'package:news_app/provider/news_provider.dart';
import 'package:news_app/provider/preferences_provider.dart';
import 'package:news_app/provider/scheduling_provider.dart';
import 'package:news_app/screen/article_web_view.dart';
import 'package:news_app/common/styles.dart';
import 'package:news_app/utils/background_service.dart';
import 'package:news_app/utils/notification_helper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screen/article_detail_screen.dart';
import 'screen/home_page.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());

  final NotificationHelper notificationHelper = NotificationHelper();
  final BackgroundService service = BackgroundService();

  service.initializeIsolate();

  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  await notificationHelper.initNotifications(flutterLocalNotificationsPlugin);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => NewsProvider(apiService: ApiService())),
        ChangeNotifierProvider(create: (_) => SchedulingProvider()),
        ChangeNotifierProvider(
            create: (_) => PreferencesProvider(
                preferencesHelper: PreferencesHelper(
                    sharedPreferences: SharedPreferences.getInstance()))),
        ChangeNotifierProvider(
            create: (_) => DatabaseProvider(databaseHelper: DatabaseHelper())
        )
      ],
      child: MaterialApp(
        title: 'News App',
        theme: ThemeData(
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: primaryColor,
                onPrimary: Colors.black,
                secondary: secondaryColor,
              ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: myTextTheme,
          appBarTheme: const AppBarTheme(elevation: 0),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: secondaryColor,
              textStyle: const TextStyle(),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(0),
                ),
              ),
            ),
          ),
        ),
        navigatorKey: navigatorKey,
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (context) => const HomePage(),
          ArticleDetailPage.routeName: (context) => ArticleDetailPage(
                article: ModalRoute.of(context)?.settings.arguments as Article,
              ),
          ArticleWebView.routeName: (context) => ArticleWebView(
                url: ModalRoute.of(context)?.settings.arguments as String,
              ),
        },
      ),
    );
  }
}
