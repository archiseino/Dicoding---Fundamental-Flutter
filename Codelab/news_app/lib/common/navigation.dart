import 'package:flutter/cupertino.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Navigation {
  static intentWithData(String routeName, Object arguments) {
    navigatorKey.currentState?.pushNamed(routeName, arguments:  arguments);
  }

  static back() => navigatorKey.currentState?.pop();
}