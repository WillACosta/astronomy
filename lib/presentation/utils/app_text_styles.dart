import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:astronomy/presentation/utils/app_colors.dart';

class AppTextStyles {
  static final logo = GoogleFonts.poiretOne(
      fontSize: 48, fontWeight: FontWeight.normal, color: AppColors.secondary);

  static TextStyle headline({Color? color}) {
    return _getPoppinsFont(
      fontSize: 36,
      fontWeight: FontWeight.w300,
      color: color,
    );
  }

  static TextStyle head({Color? color}) {
    return _getPoppinsFont(
      fontSize: 24,
      fontWeight: FontWeight.w300,
      color: color,
    );
  }

  static TextStyle bodyHead({Color? color}) {
    return _getPoppinsFont(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static body({Color? color}) {
    return _getPoppinsFont(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle bodySmall(
      {Color color = AppColors.secondary, double fontSize = 14}) {
    return _getPoppinsFont(
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle bodySmallest(
      {Color color = AppColors.secondary, double fontSize = 10}) {
    return _getPoppinsFont(
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static _getPoppinsFont({
    Color? color,
    required FontWeight fontWeight,
    required double fontSize,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
