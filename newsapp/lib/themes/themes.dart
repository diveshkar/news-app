import 'package:flutter/material.dart';

ThemeData darkModeTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF212121),
  colorScheme: ColorScheme.fromSwatch(brightness: Brightness.dark).copyWith(
    primary: const Color(0xFFB71C1C),
    secondary: const Color(0xFFD32F2F),
  ),
  scaffoldBackgroundColor: const Color(0xFF121212),
  cardColor: const Color(0xFF1E1E1E),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Color(0xFFE0E0E0)),
    bodyMedium: TextStyle(color: Color(0xFFE0E0E0)),
  ),
  iconTheme: const IconThemeData(color: Color(0xFFB71C1C)),
  tabBarTheme: const TabBarTheme(
    labelColor: Color(0xFFFFFFFF),
    unselectedLabelColor: Color(0xFFB0BEC5),
  ),
);
