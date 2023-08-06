import 'package:flutter/material.dart';
import 'package:keep_it/core/utils/styles/app_border_radius.dart';
import 'package:keep_it/core/utils/styles/app_colors.dart';

abstract class AppButtonStyles {
  static const introNext = BoxDecoration(
    color: AppColors.blueLight,
    borderRadius: BorderRadius.only(
      topLeft: AppBorderRadius.circular25,
      bottomLeft: AppBorderRadius.circular25,
    ),
  );
  static const introSkip = BoxDecoration(
    color: AppColors.blueDark,
    borderRadius: BorderRadius.only(
      topRight: AppBorderRadius.circular25,
      bottomRight: AppBorderRadius.circular25,
    ),
  );
}
