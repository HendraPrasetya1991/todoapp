import 'package:flutter/cupertino.dart';
import 'package:todoapp/screens/home_screen.dart';
import 'package:todoapp/screens/login_screen.dart';

class Routes {
  static const String initialRoute = LoginScreen.routeName;
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return CupertinoPageRoute(builder: (_) => HomeScreen());
      default:
        return CupertinoPageRoute(builder: (_) => LoginScreen());
    }
  }
}
