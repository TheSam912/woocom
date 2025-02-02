import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Responsive headline
  static TextStyle title = GoogleFonts.dosis(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textLight,
  );
  static TextStyle webAppbarItems = GoogleFonts.dosis(
    fontSize: 4.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textLight,
  );

  // Dynamic style method
  static TextStyle dynamicStyle({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return GoogleFonts.dosis(
      fontSize: fontSize?.sp ?? 16.sp,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? AppColors.textLight,
    );
  }
}
