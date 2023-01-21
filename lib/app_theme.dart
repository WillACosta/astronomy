import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:astronomy/presentation/utils/app_colors.dart';

final darkTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: AppColors.primary,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.primary,
  backgroundColor: AppColors.primary,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.secondary,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.secondary, side: const BorderSide(
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
  ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.secondary),
);

final lightTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: AppColors.secondary,
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.secondary,
  backgroundColor: AppColors.secondary,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.secondary,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.secondary, side: const BorderSide(
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
    elevation: 0,
    iconTheme: IconThemeData(
      color: AppColors.secondary,
    ),
    color: AppColors.primary, systemOverlayStyle: SystemUiOverlayStyle.light,
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
  ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.primary),
);
