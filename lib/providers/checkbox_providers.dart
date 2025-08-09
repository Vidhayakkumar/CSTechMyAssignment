import 'package:flutter/material.dart';

class CheckboxProvider with ChangeNotifier {
  bool _isChecked = false;

  bool get isChecked => _isChecked;

  void toggleCheckbox(bool value) {
    _isChecked = value;
    notifyListeners();
  }
}
