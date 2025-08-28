/*
Need to work on this global theme for the app,
this isn't used now.
*/

import 'package:flutter/material.dart';

/// Brand color
const Color kBrandColor = Color(0xFF20CFA3);

/// Custom MaterialColor (shades of your brand color)
const MaterialColor kBrandSwatch = MaterialColor(
  0xFF20CFA3,
  <int, Color>{
    50: Color(0xFFE0F7F3),
    100: Color(0xFFB3EBE0),
    200: Color(0xFF80DDCC),
    300: Color(0xFF4DCFB8),
    400: Color(0xFF26C5A8),
    500: Color(0xFF20CFA3),
    600: Color(0xFF1AB292),
    700: Color(0xFF149580),
    800: Color(0xFF0E776E),
    900: Color(0xFF084A4A),
  },
);

/// Main theme for the app
final ThemeData appTheme = ThemeData(
  useMaterial3: true, // Modern Material Design
  primarySwatch: kBrandSwatch,
  primaryColor: kBrandColor,
  scaffoldBackgroundColor: Colors.white,

  /// AppBar style
  appBarTheme: const AppBarTheme(
    backgroundColor: kBrandColor,
    foregroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),

  /// TextField style
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFFF2F2F2),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: kBrandColor, width: 2),
    ),
    hintStyle: TextStyle(
      fontSize: 14,
      color: Colors.grey.shade500,
    ),
  ),

  /// Button style
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kBrandColor,
      foregroundColor: Colors.white,
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
    ),
  ),

  /// Text styles
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: Colors.black87,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
  ),

  /// FloatingActionButton style
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: kBrandColor,
    foregroundColor: Colors.white,
    elevation: 3,
    shape: CircleBorder(),
  ),
);
