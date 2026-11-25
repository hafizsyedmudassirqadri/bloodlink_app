
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../core/responsive.dart';

class AppTheme {

  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,

      scaffoldBackgroundColor: AppColors.background,

      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.lightCard,
        onSurface: AppColors.lightText,
        onPrimary: Colors.white,
        error: AppColors.emergency,
      ),

      textTheme: GoogleFonts.poppinsTextTheme(
        TextTheme(
          headlineLarge: TextStyle(
            fontSize: Responsive.sp(context, 32),
            fontWeight: FontWeight.bold,
            color: AppColors.lightText,
          ),
          headlineMedium: TextStyle(
            fontSize: Responsive.sp(context, 26),
            fontWeight: FontWeight.bold,
            color: AppColors.lightText,
          ),
          bodyLarge: TextStyle(
            fontSize: Responsive.sp(context, 16),
            color: AppColors.lightText,
          ),
          bodyMedium: TextStyle(
            fontSize: Responsive.sp(context, 14),
            color: AppColors.lightText,
          ),
          bodySmall: TextStyle(
            fontSize: Responsive.sp(context, 12),
            color: AppColors.lightSubtext,
          ),
        ),
      ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,

      scaffoldBackgroundColor: AppColors.darkSurface,

      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.accent,
        surface: AppColors.darkCard,
        onSurface: AppColors.darkText,
        onPrimary: Colors.white,
        error: AppColors.emergency,
      ),

      textTheme: GoogleFonts.poppinsTextTheme(
        TextTheme(
          headlineLarge: TextStyle(
            fontSize: Responsive.sp(context, 32),
            fontWeight: FontWeight.bold,
            color: AppColors.darkText,
          ),
          headlineMedium: TextStyle(
            fontSize: Responsive.sp(context, 26),
            fontWeight: FontWeight.bold,
            color: AppColors.darkText,
          ),
          bodyLarge: TextStyle(
            fontSize: Responsive.sp(context, 16),
            color: AppColors.darkText,
          ),
          bodyMedium: TextStyle(
            fontSize: Responsive.sp(context, 14),
            color: AppColors.darkText,
          ),
          bodySmall: TextStyle(
            fontSize: Responsive.sp(context, 12),
            color: AppColors.darkSubtext,
          ),
        ),
      ),
    );
  }
}
