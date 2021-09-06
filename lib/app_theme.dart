import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'presentation/utils/app_colors.dart';

final darkTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: AppColors.primary,
  accentColor: AppColors.secondary,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.primary,
  backgroundColor: AppColors.primary,
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
    bodyColor: AppColors.secondary,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primary,
  ),
  switchTheme: SwitchThemeData(),
);

final lightTheme = ThemeData(
  primaryColor: AppColors.secondary,
  accentColor: AppColors.primary,
  brightness: Brightness.light,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: AppColors.secondary,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    ),
  ),
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    displayColor: AppColors.primary,
    bodyColor: AppColors.primary,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primary,
  ),
  scaffoldBackgroundColor: AppColors.secondary,
  switchTheme: SwitchThemeData(),
  backgroundColor: AppColors.secondary,
  iconTheme: IconThemeData(
    color: AppColors.secondary,
  ),
);
