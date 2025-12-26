// lib/view_models/language_view_model.dart
import 'package:flutter/material.dart';

class LanguageViewModel extends ChangeNotifier {
  String _selectedLanguage = "";
  String get selectedLanguage => _selectedLanguage;

  void selectLanguage(String language) {
    _selectedLanguage = language;
    notifyListeners(); // This triggers the highlight effect in the UI
  }

  bool get isReady => _selectedLanguage.isNotEmpty;
}