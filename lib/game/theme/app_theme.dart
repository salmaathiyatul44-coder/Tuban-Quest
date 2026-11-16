import 'package:flutter/material.dart';

class AppTheme {
  static const Color darkWood = Color(0xFF3B2A1F);
  static const Color softCream = Color(0xFFFDF8F0);
  static const Color accentGold = Color(0xFFFFD700);
  static const Color leafGreen = Color(0xFFC0A68A);

  static ThemeData get themeData {
    return ThemeData(
      primaryColor: darkWood,
      scaffoldBackgroundColor: leafGreen,
      colorScheme: const ColorScheme.light(
        primary: darkWood,
        onPrimary: softCream,
        secondary: accentGold,
        onSecondary: darkWood,
        surface: darkWood,
        onSurface: softCream,
        tertiary: softCream,
        onTertiary: darkWood,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: accentGold,
          shadows: [
            Shadow(
              color: Colors.black54,
              blurRadius: 2,
              offset: Offset(1, 1),
            ),
          ],
        ),
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: accentGold,
          shadows: [
            Shadow(
              color: Colors.black54,
              blurRadius: 2,
              offset: Offset(1, 1),
            ),
          ],
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: accentGold,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: softCream,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: softCream,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: darkWood,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: darkWood,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: accentGold),
        titleTextStyle: TextStyle(
          color: accentGold,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: darkWood,
        selectedItemColor: accentGold,
        unselectedItemColor: softCream,
        selectedIconTheme: IconThemeData(color: accentGold),
        unselectedIconTheme: IconThemeData(color: softCream),
      ),
      cardTheme: CardThemeData(
        color: darkWood,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: softCream,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accentGold,
          foregroundColor: darkWood,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}