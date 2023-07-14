import 'package:flutter/material.dart';
import 'package:keep_it/core/utils/app_border_radius.dart';
import 'package:keep_it/core/utils/app_colors.dart';

abstract class AppButtonStyles {
  static const next = BoxDecoration(
    color: AppColors.light,
    borderRadius: BorderRadius.only(
      topLeft: AppBorderRadius.circular25,
      bottomLeft: AppBorderRadius.circular25,
    ),
  );
  static const skip = BoxDecoration(
    color: AppColors.dark,
    borderRadius: BorderRadius.only(
      topRight: AppBorderRadius.circular25,
      bottomRight: AppBorderRadius.circular25,
    ),
  );
}
