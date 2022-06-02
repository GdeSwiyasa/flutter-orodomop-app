import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreferences {
  static const Theme_status = 'ThemeStatus';

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(Theme_status, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(Theme_status) ?? false;
  }
}

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: isDarkTheme ? Colors.white : Colors.black,
      backgroundColor: isDarkTheme ? Color(0xFF151515) : Colors.grey[75],
      cardColor: isDarkTheme ? Color(0xFF151515) : Colors.grey[75],
      canvasColor: isDarkTheme ? Color(0xff181A20) : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      appBarTheme: AppBarTheme(
        backgroundColor: isDarkTheme ? Color(0xff343645) : Colors.white,
        elevation: 0.0,
      ),
    );
  }
}
