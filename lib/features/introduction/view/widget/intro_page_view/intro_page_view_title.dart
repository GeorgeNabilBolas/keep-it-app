import 'package:flutter/material.dart';
import 'package:keep_it/core/utils/app_colors.dart';
import 'package:keep_it/core/utils/app_paddings.dart';
import 'package:keep_it/core/utils/app_strings.dart';
import 'package:keep_it/core/utils/app_styles_text.dart';

import '../../../../../core/utils/app_border_radius.dart';

class IntroPageViewTitle extends StatelessWidget {
  const IntroPageViewTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
          color: AppColors.light,
          borderRadius: BorderRadius.all(AppBorderRadius.circular15)),
      child: Padding(
        padding: AppPaddings.all8,
        child: Text(
          AppStrings.introtitle[0],
          style: AppTextStyles.text30,
        ),
      ),
    );
  }
}
