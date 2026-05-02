import 'package:flutter/material.dart';

/// Scarlet brand colors
class AppColors {
  AppColors._();

  static const Color primary = Color(0xFFDF8946);
  static const Color primaryDark = Color(0xFFC47030);
  static const Color danger = Color(0xFFA20E0E);
  static const Color surface = Colors.white;
  static const Color background = Color(0xFFF5F5F5);
  static const Color textPrimary = Color(0xFF2D2D2D);
  static const Color textSecondary = Color(0xFF656565);
  static const Color textHint = Color(0xFF5E5E5E);
  static const Color divider = Color(0xFFE4E4E4);
  static const Color inactive = Color(0xFF6A6A6A);
  static const Color border = Color(0xFFBABABA);
}

/// Centralized app theme
class AppTheme {
  AppTheme._();

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorSchemeSeed: AppColors.primary,
      scaffoldBackgroundColor: AppColors.surface,
      fontFamily: 'DM Sans',
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.surface,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppColors.textSecondary,
          fontSize: 19,
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w600,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
          textStyle: const TextStyle(
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.surface,
        elevation: 0,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.inactive,
        showUnselectedLabels: true,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black45),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black45),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        labelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.textHint,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
    );
  }
}
