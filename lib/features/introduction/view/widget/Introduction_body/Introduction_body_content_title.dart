import 'package:flutter/material.dart';
import 'package:keep_it/core/utils/styles/app_colors.dart';
import 'package:keep_it/core/utils/styles/app_paddings.dart';
import 'package:keep_it/core/utils/styles/app_styles_text.dart';

import '../../../../../core/utils/styles/app_border_radius.dart';

class IntroductionBodyContentTitle extends StatelessWidget {
  const IntroductionBodyContentTitle({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
          color: AppColors.blueLight,
          borderRadius: BorderRadius.all(AppBorderRadius.circular15)),
      child: Padding(
        padding: AppPaddings.introTitle,
        child: Text(
          title,
          style: AppTextStyles.text30,
        ),
      ),
    );
  }
}
