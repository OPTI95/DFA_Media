import 'package:dfa_media/core/assets/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract final class AppTheme {
  static ThemeData get theme => _theme;

  static final ThemeData _theme = ThemeData(
    scaffoldBackgroundColor: AppColors.kPrimaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.kWhiteColor,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedLabelStyle: TextStyle(color: AppColors.kThirdColor),
        showUnselectedLabels: true),
    useMaterial3: false,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.kPrimaryColor,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      //TitleH1
      titleLarge: TextStyle(
          color: AppColors.kWhiteColor,
          fontSize: 24,
          fontWeight: FontWeight.w500,
          fontFamily: Assets.fonts.stolzlMedium),
      //TitleH3
      titleMedium: TextStyle(
          color: AppColors.kWhiteColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: Assets.fonts.stolzlRegular),
      //TitileH4
      bodyMedium: TextStyle(
          fontWeight: FontWeight.w500,
          color: AppColors.kBlackColor,
          fontSize: 16,
          fontFamily: Assets.fonts.stolzlMedium),
      //LabelS
      titleSmall: TextStyle(
          fontWeight: FontWeight.w400,
          color: AppColors.kThirdColor,
          fontSize: 12,
          fontFamily: Assets.fonts.stolzlRegular),
      //LabelXS
      bodySmall: TextStyle(
          color: AppColors.kBlackColor,
          fontSize: 10,
          fontWeight: FontWeight.w400,
          fontFamily: Assets.fonts.stolzlRegular),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.kPrimaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        backgroundColor:
            MaterialStateProperty.all<Color>(AppColors.kPrimaryColor),
        elevation: const MaterialStatePropertyAll(0),
        minimumSize: const MaterialStatePropertyAll(
          Size(double.infinity, 60),
        ),
      ),
    ),
  );
}