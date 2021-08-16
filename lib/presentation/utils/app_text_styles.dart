import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  static final logo = GoogleFonts.poiretOne(
    fontSize: 48,
    fontWeight: FontWeight.normal,
    color: AppColors.secondary,
  );

  static final headline = _getPoppinsFont(
    fontSize: 36,
    fontWeight: FontWeight.w300,
    color: AppColors.secondary,
  );

  static final head = _getPoppinsFont(
    fontSize: 24,
    fontWeight: FontWeight.w300,
    color: AppColors.secondary,
  );

  static final bodyHead = _getPoppinsFont(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.secondary,
  );

  static final body = _getPoppinsFont(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.secondary,
  );

  static final bodySmallest = _getPoppinsFont(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.secondary,
  );

  static TextStyle bodySmall({Color color = AppColors.secondary, double fontSize = 14}) {
    return _getPoppinsFont(
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static _getPoppinsFont({
    required Color color,
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
