import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'presentation/utils/app_colors.dart';

final darkTheme = ThemeData(
  primaryColor: AppColors.primary,
  accentColor: AppColors.secondary,
  brightness: Brightness.dark,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: AppColors.secondary,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      primary: AppColors.secondary,
      side: BorderSide(
        color: AppColors.secondary,
        width: 1,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    ),
  ),
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    displayColor: AppColors.secondary,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primary,
  ),
  scaffoldBackgroundColor: AppColors.primary,
);

final lightTheme = ThemeData(
  primaryColor: AppColors.secondary,
  accentColor: AppColors.primary,
  brightness: Brightness.light,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: AppColors.primary,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      primary: AppColors.primary,
      side: BorderSide(
        color: AppColors.primary,
        width: 1,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    ),
  ),
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    displayColor: AppColors.primary,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primary,
  ),
  scaffoldBackgroundColor: AppColors.secondary,
  switchTheme: SwitchThemeData(),
);
