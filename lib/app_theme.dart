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
      side: const BorderSide(
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
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primary,
  ),
  iconTheme: const IconThemeData(
    color: AppColors.secondary,
  ),
  dialogTheme: DialogTheme(
    backgroundColor: AppColors.primary,
    elevation: 1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
  primarySwatch: Colors.grey,
);

final lightTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: AppColors.secondary,
  accentColor: AppColors.primary,
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.secondary,
  backgroundColor: AppColors.secondary,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: AppColors.secondary,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      primary: AppColors.secondary,
      side: const BorderSide(
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
    bodyColor: AppColors.primary,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primary,
    elevation: 0,
    iconTheme: IconThemeData(
      color: AppColors.secondary,
    ),
  ),
  iconTheme: const IconThemeData(
    color: AppColors.secondary,
  ),
  dialogTheme: DialogTheme(
    backgroundColor: AppColors.secondary,
    elevation: 1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
);
