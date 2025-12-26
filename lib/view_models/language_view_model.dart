import 'package:flutter/material.dart';

class LanguageViewModel extends ChangeNotifier {
  String _selectedLanguage = "";
  String get selectedLanguage => _selectedLanguage;

  void selectLanguage(String language) {
    _selectedLanguage = language;
    notifyListeners();
  }

  bool get isReady => _selectedLanguage.isNotEmpty;
}