import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/screens/home_screen.dart';
import 'package:todoapp/services/navigation_service.dart';
import 'package:todoapp/utils/text_validator.dart';

class LoginViewModel extends ChangeNotifier {
  final NavigationService navigationService;
  String error;
  String username;

  Future<void> validate(String username) {
    if (!TextValidator.validateUserName(username)) {
      error = 'Username must start with letter';
      notifyListeners();
      return null;
    }
    this.username = username;
    return navigationService.navigateToAndReplace(HomeScreen.routeName);
  }

  LoginViewModel(this.navigationService);
}
