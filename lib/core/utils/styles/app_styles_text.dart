import 'package:flutter/material.dart';
import 'package:keep_it/core/utils/styles/app_colors.dart';

import 'app_strings.dart';

abstract class AppTextStyles {
  ///////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////
  static const text40 = TextStyle(
    color: AppColors.blueDark,
    fontFamily: AppStrings.introRustFont,
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );
  static const text30 = TextStyle(
    color: AppColors.blueDark,
    fontSize: 36,
    fontWeight: FontWeight.w900,
  );
  static const text22 = TextStyle(
    color: AppColors.blueDark,
    fontSize: 22,
    fontWeight: FontWeight.w800,
  );
  static const text18 = TextStyle(
    color: AppColors.blueDark,
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );
  static const text14 = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
  static const text12 = TextStyle(
    color: AppColors.blueDark,
    fontFamily: AppStrings.introRustFont,
    fontSize: 12,
    fontWeight: FontWeight.w100,
  );
  static const text12Bold = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
}
