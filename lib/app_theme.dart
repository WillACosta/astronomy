import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'presentation/utils/app_colors.dart';

final appTheme = ThemeData(
  primaryColor: AppColors.primary,
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
