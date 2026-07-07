import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/style/colors.dart';
import 'package:to_do_list_app/core/style/text_style.dart';

ThemeData theme() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      elevation: 0,
      surfaceTintColor: AppColors.black,
      centerTitle: true,
    ),
    dividerColor: Colors.transparent,
    scaffoldBackgroundColor: AppColors.background,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        minimumSize: const Size(double.infinity, 60),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        foregroundColor: AppColors.background,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size(60, 30),
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      // text color
      onSurface: AppColors.black,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.accent,
      filled: true,
      hintStyle: TextStyles.caption2,
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      selectedLabelStyle: TextStyles.caption2.copyWith(
        fontWeight: FontWeight.w600,
        height: 2,
      ),
      unselectedLabelStyle: TextStyles.caption2.copyWith(
        fontWeight: FontWeight.w600,
        height: 2,
      ),
      elevation: 0,
    ),
  );
}
