import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataProvider with ChangeNotifier {
  String _name = '';
  String _email = '';
  String _whNumber = '';

  String get name => _name;
  String get email => _email;
  String get whNumber => _whNumber;

  // Set and Save to SharedPreferences
  Future<void> setUserData(String name, String email, String whNumber) async {
    _name = name;
    _email = email;
    _whNumber = whNumber;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('email', email);
    await prefs.setString('whNumber', whNumber);
  }

  // Load from SharedPreferences
  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    _name = prefs.getString('name') ?? '';
    _email = prefs.getString('email') ?? '';
    _whNumber = prefs.getString('whNumber') ?? '';
    notifyListeners();
  }

  // Clear User Data
  Future<void> clearUserData() async {
    _name = '';
    _email = '';
    _whNumber = '';
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
