import 'package:flutter/material.dart';
import '../components/public_variables.dart';

//======================================================================
// APPTHEME CLASS
//======================================================================
class AppTheme {
  Color brandColor = Colors.pink.shade800;
  Color bgColor = PublicVariables.isDarkThemeDB.get(0) as bool
      ? DarkTheme().bgColor
      : LightTheme().bgColor;
  Color primaryColor = PublicVariables.isDarkThemeDB.get(0) as bool
      ? DarkTheme().primaryColor
      : LightTheme().primaryColor;
  Color textColor = PublicVariables.isDarkThemeDB.get(0) as bool
      ? DarkTheme().textColor
      : LightTheme().textColor;
  Color lightDark = PublicVariables.isDarkThemeDB.get(0) as bool
      ? DarkTheme().lightDark
      : LightTheme().lightDark;
}

//======================================================================
// DART THEME CLASS
//======================================================================
class DarkTheme {
  Color bgColor = const Color(0xff212529);
  Color primaryColor = const Color(0xffe9ecef);
  Color lightDark = const Color(0xffadb5bd);
  Color textColor = const Color(0xffe9ecef);
}

//======================================================================
// LIGHT THEME CLASS
//======================================================================
class LightTheme {
  Color bgColor = const Color(0xfff8f9fa);
  Color textColor = const Color(0xff343a40);
  Color primaryColor = const Color(0xff14213d);
  Color lightDark = const Color(0xffced4da);
}
