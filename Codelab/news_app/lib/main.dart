import 'package:flutter/material.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/screen/article_web_view.dart';
import 'package:news_app/common/styles.dart';
import 'screen/article_detail_screen.dart';
import 'screen/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: primaryColor,
          onPrimary: onPrimary,
          secondary: secondaryColor
        ),
        textTheme: myTextTheme,
        appBarTheme: const AppBarTheme(elevation: 0),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: secondaryColor,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(0)
              )
            )
          ),
        ),
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        ArticleDetailPage.routeName: (context) => ArticleDetailPage(article:
          ModalRoute.of(context)?.settings.arguments as Article
        ),
        ArticleWebView.routeName: (context) => ArticleWebView(url:
          ModalRoute.of(context)?.settings.arguments as String
        )
      },
    );
  }
}




