import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/common/styles.dart';
import 'package:news_app/data/preferences/preferences_helper.dart';

class PreferencesProvider extends ChangeNotifier {
  bool _isDarkTheme =  false;
  bool get isDarkTheme => _isDarkTheme;

  bool _isDailyNewsActive = false;
  bool get isDailyNewsActive => _isDailyNewsActive;

  ThemeData get themeData => _isDarkTheme ? darkTheme : lightTheme;

  PreferencesHelper preferencesHelper;

  PreferencesProvider({required this.preferencesHelper}) {
    _getTheme();
    _getDailyNewsPreference();
  }

  void _getTheme() async {
    _isDarkTheme = await preferencesHelper.isDarkTheme;
    notifyListeners();
  }

  void  _getDailyNewsPreference() async {
    _isDailyNewsActive = await preferencesHelper.isDailyNewsActive;
    notifyListeners();
  }

  void enableDarkTheme(bool value) {
     preferencesHelper.setDarkTheme(value);
    _getTheme();
  }

  void enableDailyNews(bool value) {
    preferencesHelper.setDailyNews(value);
    _getDailyNewsPreference();
  }
}