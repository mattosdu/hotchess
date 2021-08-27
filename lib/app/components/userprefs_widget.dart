import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences _pref;

class ThemeNotifier extends ChangeNotifier {
  bool _darkTheme;

  bool get darkTheme => _darkTheme;

  ThemeNotifier() {
    _darkTheme = false;
    _loadFromPrefs();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if (_pref == null) _pref = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = _pref.getBool('theme') ?? false;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _pref.setBool('theme', _darkTheme);
  }
}

class IntroNotifier {
  bool _introPass;

  bool get darkTheme => _introPass;

  IntroNotifier() {
    _introPass = false;
    _loadFromPrefs();
  }

  toggleIntro() {
    _introPass = true;
    _saveToPrefs();
  }

  _initPrefs() async {
    if (_pref == null) _pref = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _introPass = _pref.getBool('intropass') ?? false;
  }

  _saveToPrefs() async {
    await _initPrefs();
    _pref.setBool('intropass', _introPass);
  }
}
