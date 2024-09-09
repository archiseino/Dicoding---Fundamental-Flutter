import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_service.dart';
import 'package:news_app/provider/news_provider.dart';
import 'package:news_app/widgets/platform_widget.dart';
import 'package:news_app/screen/settings_page.dart';
import 'package:news_app/common/styles.dart';
import 'package:provider/provider.dart';

import 'article_list_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/home_page";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(androidBuilder: _buildAndroid, iosBuilder: _buildIos);
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: secondaryColor,
        currentIndex: _bottomNavIndex,
        items: _bottomNavBarItem,
        onTap: (selected) {
          setState(() {
            _bottomNavIndex = selected;
          });
        },
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
          activeColor: secondaryColor, items: _bottomNavBarItem),
      tabBuilder: (context, index) {
        return _listWidget[index];
      },
    );
  }

  final List<Widget> _listWidget = [
    ChangeNotifierProvider(
      create: (_) => NewsProvider(apiService: ApiService()),
      child: const ArticleListPage(),
    ),
    const SettingsPage()
  ];

  List<BottomNavigationBarItem> _bottomNavBarItem = [
    BottomNavigationBarItem(
        icon: Icon(Platform.isIOS ? CupertinoIcons.news : Icons.public),
        label: "Headline"),
    BottomNavigationBarItem(
        icon: Icon(Platform.isIOS ? CupertinoIcons.gear : Icons.settings),
        label: "Settings"),
  ];
}
