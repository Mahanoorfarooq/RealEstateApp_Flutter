import 'package:flutter/material.dart';

class UserData extends ChangeNotifier {
  String _username = '';
  String _email = '';

  String get username => _username;
  String get email => _email;

  void setUserData(String username, String email) {
    _username = username;
    _email = email;
    notifyListeners();
  }
}
