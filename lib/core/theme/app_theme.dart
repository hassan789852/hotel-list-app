import 'package:flutter/material.dart';
import 'package:hotel_list_app/core/constant/constant.dart';
import 'package:hotel_list_app/core/theme/app_colors.dart';

class AppTheme {
  AppTheme._();

  static OutlineInputBorder focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(Constant.TextFieldBorder),
      borderSide: BorderSide(
          strokeAlign: BorderSide.strokeAlignOutside,
          color: AppColors.main,
          width: Constant.TextFieldBorderWidth));

  static OutlineInputBorder enabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(Constant.TextFieldBorder),
      borderSide: BorderSide(
          strokeAlign: BorderSide.strokeAlignOutside,
          color: AppColors.lightGray,
          width: Constant.TextFieldBorderWidth));

  static OutlineInputBorder errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(Constant.TextFieldBorder),
      borderSide: BorderSide(
          strokeAlign: BorderSide.strokeAlignOutside,
          color: AppColors.errorColor,
          width: Constant.TextFieldBorderWidth));

  static UnderlineInputBorder enableUnderLineBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(Constant.TextFieldBorder),
      borderSide: BorderSide(
          color: AppColors.main, width: Constant.TextFieldBorderWidth));

  static UnderlineInputBorder errorUnderLineBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(Constant.TextFieldBorder),
      borderSide: BorderSide(
          color: AppColors.errorColor, width: Constant.TextFieldBorderWidth));

  static UnderlineInputBorder focusUnderLineBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(Constant.TextFieldBorder),
      borderSide: BorderSide(
          color: AppColors.main, width: Constant.TextFieldBorderWidth));
  static final ThemeData defaultTheme = ThemeData(
    // Core brand colors
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: ColorScheme.light(
      primary: AppColors.primary, // was primaryColor
      secondary: AppColors.main, // use this for Scaffold, Containers, etc.
      surface: Colors.white, // Card, Dialog backgrounds
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: AppColors.textPrimary,
    ),

    // AppBar styling
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: AppColors.main,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.main),
      titleTextStyle: TextStyle(
        color: AppColors.main,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),

    // Text styling
    textTheme: TextTheme(
      /// was `headline6` → Venue titles (e.g. “Anantara The Palm…”)
      titleLarge: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),

      /// was `subtitle1` → Location subtitles (e.g. “The Palm, Dubai”)
      titleMedium: TextStyle(
        color: AppColors.textSecondary,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),

      /// was `bodyText1` → Description paragraphs
      bodyLarge: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 1.5,
      ),

      /// was `bodyText2` → List item titles (e.g. “Free nanny access”)
      bodyMedium: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),

      /// was `caption` → Tags, metadata, times (e.g. “10:00 – 22:00”)
      labelSmall: TextStyle(
        color: AppColors.textSecondary,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),

    // Chip styling (category selectors)
    chipTheme: ChipThemeData(
      backgroundColor: Colors.white,
      selectedColor: AppColors.accent,
      disabledColor: AppColors.background,
      labelStyle: TextStyle(color: AppColors.main),
      secondaryLabelStyle: TextStyle(color: Colors.white),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: StadiumBorder(side: BorderSide(color: AppColors.border)),
    ),

// Elevated button styling
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.main, // was `primary`
        foregroundColor: Colors.white, // was `onPrimary`
        shape: StadiumBorder(), // pill shape
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    ),

// TextButton styling
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.main, // replaces old `primary`
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    ),

    dividerTheme: DividerThemeData(color: AppColors.lightGray),

    dividerColor: AppColors.transparent,

    // Search box & inputs
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.border),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary),
        borderRadius: BorderRadius.circular(8),
      ),
      hintStyle: TextStyle(color: AppColors.textSecondary),
    ),
  );
}
