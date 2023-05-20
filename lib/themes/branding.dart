import 'package:flutter/material.dart';

const String imgLogoBrand =
    'https://my.alvyss.com/api/v1/cloudron/avatar?2395601373707481';
const int colorPrimaryLightBrand = 0xFF00FFFF;
const int colorSecondaryLightBrand = 0xDD9100FF;
const int colorBackgroundLightDefault = 0xDDE8CBFF;
const int colorForegroundLightDefault = 0xFF0000FF;
const int colorHighlightLight = 0xFF50A6F8;
const int colorPrimaryDarkBrand = 0xFF00FFFF;
const int colorSecondaryDarkBrand = 0xDD0000FF;
const int colorBackgroundDarkDefault = 0xDD1326FF;
const int colorForegroundDarkDefault = 0x50A6F8FF;
const int colorHighlightDark = 0xFFFF9100;
ThemeData themeDark = ThemeData(
  // This is the theme of your application.
  //
  // Try running your application with "flutter run". You'll see the
  // application has a blue toolbar. Then, without quitting the app, try
  // changing the primarySwatch below to Colors.green and then invoke
  // "hot reload" (press "r" in the console where you ran "flutter run",
  // or simply save your changes to "hot reload" in a Flutter IDE).
  // Notice that the counter didn't reset back to zero; the application
  // is not restarted.
  fontFamily: "M Plus Rounded",
  primarySwatch: Colors.cyan,
  colorScheme: const ColorScheme(
      background: Color(colorBackgroundDarkDefault),
      primary: Color(colorPrimaryDarkBrand),
      secondary: Color(colorSecondaryDarkBrand),
      brightness: Brightness.dark,
      error: Colors.redAccent,
      surface: Colors.blue,
      onBackground: Color(colorForegroundDarkDefault),
      onPrimary: Colors.white,
      onSecondary: Colors.white70,
      onError: Colors.redAccent,
      onSurface: Colors.blue),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white24,
      selectedIconTheme: IconThemeData(color: Color(colorHighlightDark)),
      unselectedIconTheme: IconThemeData(color: Color(colorPrimaryDarkBrand)),
      selectedItemColor: Color(colorHighlightDark),
      unselectedItemColor: Color(colorPrimaryDarkBrand),
      selectedLabelStyle: TextStyle(color: Color(colorHighlightDark)),
      unselectedLabelStyle: TextStyle(color: Color(colorPrimaryDarkBrand)),
      type: BottomNavigationBarType.fixed),
  secondaryHeaderColor: Colors.transparent,
);
ThemeData themeLight = ThemeData(
  // This is the theme of your application.
  //
  // Try running your application with "flutter run". You'll see the
  // application has a blue toolbar. Then, without quitting the app, try
  // changing the primarySwatch below to Colors.green and then invoke
  // "hot reload" (press "r" in the console where you ran "flutter run",
  // or simply save your changes to "hot reload" in a Flutter IDE).
  // Notice that the counter didn't reset back to zero; the application
  // is not restarted.
  fontFamily: "M Plus Rounded",
  primarySwatch: Colors.cyan,
  colorScheme: const ColorScheme(
      background: Color(colorBackgroundLightDefault),
      primary: Color(colorPrimaryLightBrand),
      secondary: Color(colorSecondaryLightBrand),
      brightness: Brightness.light,
      error: Colors.redAccent,
      surface: Colors.blue,
      onBackground: Color(colorForegroundLightDefault),
      onPrimary: Colors.black,
      onSecondary: Colors.white70,
      onError: Colors.redAccent,
      onSurface: Colors.blue),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white24,
      selectedIconTheme: IconThemeData(color: Color(colorHighlightDark)),
      unselectedIconTheme: IconThemeData(color: Color(colorPrimaryDarkBrand)),
      selectedItemColor: Color(colorHighlightDark),
      unselectedItemColor: Color(colorPrimaryDarkBrand),
      selectedLabelStyle: TextStyle(color: Color(colorHighlightDark)),
      unselectedLabelStyle: TextStyle(color: Color(colorPrimaryDarkBrand)),
      type: BottomNavigationBarType.fixed),
  secondaryHeaderColor: Colors.transparent,
);
