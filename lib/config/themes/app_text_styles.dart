import 'package:flutter/material.dart';
import 'package:recipesapp/config/themes/app_colors.dart';
import 'package:recipesapp/config/themes/app_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  // base text Styles

  static const baseParagraph = TextStyle(
    fontSize: 14,
    height: 15 / 14,
    fontWeight: FontWeight.w300,
    fontFamily: AppFonts.leagueSpartan,
  );
  static const baseText = TextStyle(
    fontSize: 16,
    // height: 15 / 14,
    fontWeight: FontWeight.w500,
    fontFamily: AppFonts.poppines,
  );
  static const baseSubText = TextStyle(
    fontSize: 12,
    // height: 15 / 14,
    fontWeight: FontWeight.normal,
    fontFamily: AppFonts.poppines,
  );
  static const baseTitle = TextStyle(
    fontSize: 20,
    height: 20 / 22,
    fontWeight: FontWeight.w600,
    fontFamily: AppFonts.poppines,
  );
  static const baseSubTitle = TextStyle(
    fontSize: 15,
    // height: 15 / 14,
    fontWeight: FontWeight.w500,
    fontFamily: AppFonts.poppines,
  );

  static TextTheme lightText = TextTheme(
    titleLarge: TextStyle(
      fontSize: 20,
      height: 20 / 22,
      fontWeight: FontWeight.w600,
      fontFamily: AppFonts.poppines,
      color: AppColors.primaryColor,
    ),
    titleMedium: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      fontFamily: AppFonts.poppines,
      color: AppColors.primaryColor,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: AppFonts.poppines,
      color: AppColors.brownTowColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      height: 15 / 14,
      fontWeight: FontWeight.w300,
      fontFamily: AppFonts.leagueSpartan,
      color: AppColors.brownTowColor,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      // height: 15 / 14,
      fontWeight: FontWeight.w400,
      fontFamily: AppFonts.poppines,
      color: AppColors.brownTowColor,
    ),

    headlineLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontFamily: AppFonts.leagueSpartan,
      color: AppColors.brownTowColor,
    ),
    headlineMedium: TextStyle(
      fontSize: 13.45,
      fontWeight: FontWeight.w400,
      fontFamily: AppFonts.poppines,
      color: AppColors.brownTowColor,
    ),
    labelLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: AppFonts.leagueSpartan,
      color: AppColors.primaryColor,
    ),
    displayLarge: TextStyle(
      fontSize: 25.31,
      fontWeight: FontWeight.w400,
      fontFamily: AppFonts.poppines,
      color: AppColors.primaryColor,
    ),
  );

  static TextTheme darkText = TextTheme(
    titleLarge: TextStyle(
      fontSize: 20,
      height: 20 / 22,
      fontWeight: FontWeight.w600,
      fontFamily: AppFonts.poppines,
      color: AppColors.primaryColor,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      // height: 15 / 14,
      fontWeight: FontWeight.w400,
      fontFamily: AppFonts.poppines,
      color: AppColors.whiteTextColor,
    ),
    titleMedium: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      fontFamily: AppFonts.poppines,
      color: AppColors.primaryColor,
    ),

    headlineLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontFamily: AppFonts.leagueSpartan,
      color: AppColors.whiteTextColor,
    ),
    headlineMedium: TextStyle(
      fontSize: 13.45,
      fontWeight: FontWeight.w400,
      fontFamily: AppFonts.poppines,
      color: AppColors.whiteTextColor,
    ),
    displayLarge: TextStyle(
      fontSize: 25.31,
      fontWeight: FontWeight.w400,
      fontFamily: AppFonts.poppines,
      color: AppColors.primaryColor,
    ),
  );
}















  // // base text Styles

  // static const baseParagraph = TextStyle(
  //   fontSize: 14,
  //   height: 15 / 14,
  //   fontWeight: FontWeight.w300,
  //   fontFamily: AppFonts.leagueSpartan,
  // );
  // static const baseText = TextStyle(
  //   fontSize: 16,
  //   // height: 15 / 14,
  //   fontWeight: FontWeight.w500,
  //   fontFamily: AppFonts.poppines,
  // );
  // static const baseSubText = TextStyle(
  //   fontSize: 12,
  //   // height: 15 / 14,
  //   fontWeight: FontWeight.normal,
  //   fontFamily: AppFonts.poppines,
  // );
  // static const baseTitle = TextStyle(
  //   fontSize: 20,
  //   height: 20 / 22,
  //   fontWeight: FontWeight.w600,
  //   fontFamily: AppFonts.poppines,
  // );
  // static const baseSubTitle = TextStyle(
  //   fontSize: 15,
  //   // height: 15 / 14,
  //   fontWeight: FontWeight.w500,
  //   fontFamily: AppFonts.poppines,
  // );





  //simple design system

  // static const simpleTitleHero = TextStyle(
  //   fontSize: 72,
  //   height: 1.2,
  //   fontWeight: FontWeight.w800,
  //   fontFamily: AppFonts.inter,
  //   letterSpacing: -0.03,
  // );
  // static const simpleTitlePage = TextStyle(
  //   fontSize: 48,
  //   height: 1.2,
  //   fontWeight: FontWeight.w700,
  //   fontFamily: AppFonts.inter,
  //   letterSpacing: -0.02,
  // );
  // static const simpleSubTitle = TextStyle(
  //   fontSize: 32,
  //   height: 1.2,
  //   fontWeight: FontWeight.w400,
  //   fontFamily: AppFonts.inter,
  //   letterSpacing: 0,
  // );
  // static const simpleHeading = TextStyle(
  //   fontSize: 24,
  //   height: 1.2,
  //   fontWeight: FontWeight.w600,
  //   fontFamily: AppFonts.inter,
  //   letterSpacing: -0.02,
  // );
  // static const simpleSubHeading = TextStyle(
  //   fontSize: 20,
  //   height: 1.2,
  //   fontWeight: FontWeight.w400,
  //   fontFamily: AppFonts.inter,
  //   letterSpacing: 0,
  // );
  // static const simpleBodyBase = TextStyle(
  //   fontSize: 16,
  //   height: 1.4,
  //   fontWeight: FontWeight.w400,
  //   fontFamily: AppFonts.inter,
  //   letterSpacing: 0,
  // );
  // static const simpleBodyStrong = TextStyle(
  //   fontSize: 16,
  //   height: 1.4,
  //   fontWeight: FontWeight.w600,
  //   fontFamily: AppFonts.inter,
  //   letterSpacing: 0,
  // );
  // static const simpleBodyEmphasis = TextStyle(
  //   fontSize: 16,
  //   height: 1.4,
  //   // fontWeight: FontWeight.w600,
  //   fontFamily: AppFonts.inter,
  //   fontStyle: FontStyle.italic,
  //   letterSpacing: 0,
  // );
  // static const simpleBodyLink = TextStyle(
  //   fontSize: 16,
  //   height: 1.4,
  //   fontWeight: FontWeight.w400,
  //   fontFamily: AppFonts.inter,
  //   letterSpacing: 0,
  // );
  // static const simpleBodySmall = TextStyle(
  //   fontSize: 14,
  //   height: 1.4,
  //   fontWeight: FontWeight.w400,
  //   fontFamily: AppFonts.inter,
  //   letterSpacing: 0,
  // );
  // static const simpleBodySmallStrong = TextStyle(
  //   fontSize: 14,
  //   height: 1.4,
  //   fontWeight: FontWeight.w600,
  //   fontFamily: AppFonts.inter,
  //   letterSpacing: 0,
  // );
  // static const simpleBodyCode = TextStyle(
  //   fontSize: 16,
  //   height: 1.0,
  //   fontWeight: FontWeight.w400,
  //   fontFamily: AppFonts.robotoMono,
  //   letterSpacing: 0,
  // );

  // //! adds

  // static const title = TextStyle(
  //   fontSize: 25.31,
  //   // height: 1.0,
  //   fontWeight: FontWeight.w400,
  //   fontFamily: AppFonts.poppines,
  //   letterSpacing: 0,
  // );