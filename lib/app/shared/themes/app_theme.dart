import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static const Color background = Color(0xFFF8F9FB);
  static const Color surface = Colors.white;
  static const Color primary = Color.fromARGB(255, 160, 123, 22);
  static const Color gold = primary;
  static const Color onPrimary = Colors.white;
  static const Color primaryText = Color(0xFF1A1A1A);
  static const Color mutedText = Color(0xFF888888);
  static const Color faintText = Color(0xFFA7AEB7);
  static const Color divider = Color(0xFFE8EAEE);
  static const Color danger = Color(0xFFE74C3C);
  static const Color softSurface = Color(0xFFF1F3F5);
  static const Color shadow = Color(0x12000000);

  static ThemeData darkLuxury = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    scaffoldBackgroundColor: background,
    colorScheme: const ColorScheme.light(
      primary: primary,
      secondary: primary,
      surface: surface,
      onPrimary: onPrimary,
      onSurface: primaryText,
      outline: divider,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: background,
      elevation: 0,
      scrolledUnderElevation: 0,
      iconTheme: IconThemeData(color: primaryText),
      titleTextStyle: TextStyle(
        color: primaryText,
        fontSize: 18,
        fontWeight: FontWeight.w800,
      ),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(color: primaryText),
      headlineSmall: TextStyle(color: primaryText),
      titleLarge: TextStyle(color: primaryText),
      titleMedium: TextStyle(color: primaryText),
      titleSmall: TextStyle(color: primaryText),
      bodyLarge: TextStyle(color: primaryText),
      bodyMedium: TextStyle(color: primaryText),
      bodySmall: TextStyle(color: mutedText),
    ),
    cardTheme: CardThemeData(
      color: surface,
      elevation: 0,
      shadowColor: shadow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    iconTheme: const IconThemeData(color: primaryText),
    dividerColor: divider,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: surface,
      selectedItemColor: primary,
      unselectedItemColor: faintText,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: onPrimary,
        elevation: 0,
        textStyle: const TextStyle(fontWeight: FontWeight.w800),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surface,
      hintStyle: const TextStyle(color: faintText),
      labelStyle: const TextStyle(color: mutedText),
      prefixIconColor: mutedText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: divider),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: primary),
      ),
    ),
  );
}
