import 'package:flutter/material.dart';
import 'package:videocall/core/constants/color.dart';
import 'dimensions.dart';

class AppTextStyles {
  static TextStyle appBarTitle(double screenWidth) => TextStyle(
    fontSize: screenWidth * Dimens.titleFontRatio,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: 1.2,
  );

  static TextStyle body(double screenWidth) => TextStyle(
    fontSize: screenWidth * Dimens.bodyFontRatio,
    color: AppColors.textPrimary,
  );

  static TextStyle hint(double screenWidth) => TextStyle(
    fontSize: screenWidth * Dimens.bodyFontRatio,
    color: AppColors.icon,
  );
}
