import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserModel extends ChangeNotifier {
  String _name = "John Doe";
  String _email = "john.doe@example.com";
  String _position = "Manager";

  String get name => _name;
  String get email => _email;
  String get position => _position;

  UserModel() {
    _loadUserData();
  }

  void _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    _name = prefs.getString('name') ?? "John Doe";
    _email = prefs.getString('email') ?? "john.doe@example.com";
    _position = prefs.getString('position') ?? "Manager";
    notifyListeners();
  }

  void updateUser(String name, String email, String position) async {
    _name = name;
    _email = email;
    _position = position;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    prefs.setString('name', _name);
    prefs.setString('email', _email);
    prefs.setString('position', _position);
  }

  void deleteUser() async {
    _name = "John Doe";
    _email = "john.doe@example.com";
    _position = "Manager";
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    prefs.remove('name');
    prefs.remove('email');
    prefs.remove('position');
  }
}