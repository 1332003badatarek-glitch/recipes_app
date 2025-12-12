import 'package:flutter/material.dart';
import 'package:recipesapp/config/themes/app_colors.dart';
import 'package:recipesapp/config/themes/app_fonts.dart';
import 'package:recipesapp/config/themes/app_text_styles.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  // primaryColor: AppColors.primaryColor,
  colorScheme:
      ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        brightness: Brightness.dark,
      ).copyWith(
        primary: AppColors.primaryColor,
        onPrimary: AppColors.primaryColor,
      ),
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.darkBackground,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    titleTextStyle: TextStyle(
      fontSize: 25.5,
      color: AppColors.primaryColor,
      fontFamily: AppFonts.poppines,
      fontWeight: FontWeight.w500,
    ),

    leadingWidth: 28,
    actionsIconTheme: IconThemeData(color: AppColors.primaryColor),
    actionsPadding: EdgeInsets.all(22),
  ),
  primaryTextTheme: TextTheme(
    bodyLarge: TextStyle(color: AppColors.secondryColor),
    bodySmall: TextStyle(color: AppColors.secondryColor),
    headlineLarge: TextStyle(color: AppColors.whiteTextColor),
  ),
  textTheme: AppTextStyles.darkText,
  inputDecorationTheme: InputDecorationThemeData(
    contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),

    filled: true,
    hintStyle: AppTextStyles.baseText.copyWith(
      color: AppColors.brownTowColor.withValues(alpha: 0.4),
    ),
    suffixIconColor: AppColors.brownTowColor.withValues(alpha: 0.8),
    fillColor: AppColors.componentPink,
    hoverColor: AppColors.primaryColor,

    errorBorder: OutlineInputBorder(
      gapPadding: 10,
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Colors.red),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    ),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppColors.primaryColor,
    selectionColor: AppColors.primaryColor.withValues(alpha: 0.3),
    selectionHandleColor: AppColors.primaryColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
      overlayColor: WidgetStateProperty.all(
        AppColors.brownOneColor.withValues(alpha: 0.3),
      ),
    ),
  ),

  shadowColor: AppColors.whiteTextColor.withValues(alpha: 0.2),
);
