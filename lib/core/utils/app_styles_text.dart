import 'package:flutter/material.dart';
import 'package:keep_it/core/utils/app_colors.dart';

import 'app_strings.dart';

abstract class AppTextStyles {
  ///////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////
  static const text40 = TextStyle(
    color: AppColors.dark,
    fontFamily: AppStrings.fontFamily,
    fontSize: 40,
    fontWeight: FontWeight.w900,
  );
  static const text30 = TextStyle(
    color: AppColors.dark,
    fontFamily: AppStrings.fontFamily,
    fontSize: 30,
    fontWeight: FontWeight.w800,
  );
  static const textNormal18 = TextStyle(
    color: AppColors.dark,
    fontFamily: AppStrings.fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );
  static const textBold18 = TextStyle(
    color: AppColors.dark,
    fontFamily: AppStrings.fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static const text12 = TextStyle(
    color: AppColors.dark,
    fontFamily: AppStrings.fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
}
