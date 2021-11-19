import 'package:flutter/material.dart';

class NavigationService {
  GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateToAndReplace(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  void goBack() {
    return _navigationKey.currentState.pop();
  }
}
