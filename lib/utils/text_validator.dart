class TextValidator {
  /// Username has to start with letter not number
  static bool validateUserName(String username) {
    if (username == null || username.isEmpty) return false;
    return RegExp(r"^[a-zA-Z].*").hasMatch(username);
  }
}
