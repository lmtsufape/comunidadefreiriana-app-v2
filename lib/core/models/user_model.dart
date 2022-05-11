import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  int id = 0;
  String token = '';
  String name = '';

  void setUser(int id, String token, String name) {
    this.id = id;
    this.token = token;
    this.name = name;

    notifyListeners();
  }
}
