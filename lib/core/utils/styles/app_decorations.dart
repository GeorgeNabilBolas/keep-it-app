import 'package:flutter/material.dart';

import 'app_radius.dart';
import 'app_colors.dart';
import 'app_dimension.dart';

abstract class AppDecorations {
  static const introTitle = BoxDecoration(
    color: AppColors.blueLight,
    borderRadius: BorderRadius.all(AppRadius.circular15),
  );
  static const introNext = BoxDecoration(
    color: AppColors.blueLight,
    borderRadius: BorderRadius.only(
      topLeft: AppRadius.circular25,
      bottomLeft: AppRadius.circular25,
    ),
  );
  static const introSkip = BoxDecoration(
    color: AppColors.blueDark,
    borderRadius: BorderRadius.only(
      topRight: AppRadius.circular25,
      bottomRight: AppRadius.circular25,
    ),
  );
  static const introGo = BoxDecoration(
    color: AppColors.blueLight,
    borderRadius: BorderRadius.all(
      AppRadius.circular25,
    ),
  );
  static const introSlidingIndicatorDark = BoxDecoration(
    color: AppColors.blueDark,
    borderRadius: BorderRadius.all(AppRadius.circular25),
  );
  static const introSlidingIndicatorLight = BoxDecoration(
    color: AppColors.blueLight,
    borderRadius: BorderRadius.all(AppRadius.circular25),
  );

  static BoxDecoration introAppBar(Size size) {
    return BoxDecoration(
      color: AppColors.blueLight,
      borderRadius: BorderRadiusDirectional.vertical(
        bottom: Radius.elliptical(
          size.width,
          size.height / AppDimension.introAppBarRadius,
        ),
      ),
    );
  }

  static const homePageAppBar = RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      bottom: AppRadius.circular15,
    ),
  );
  static const homeListTile = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(AppRadius.circular10),
  );
  static const homeDialog = BoxDecoration(
    color: AppColors.blueMedium,
    borderRadius: BorderRadius.all(AppRadius.circular10),
  );
}
