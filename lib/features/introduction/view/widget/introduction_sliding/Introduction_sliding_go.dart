import 'package:flutter/material.dart';
import 'package:keep_it/core/utils/methods/navigation_method.dart';
import 'package:keep_it/core/utils/styles/app_border_radius.dart';
import 'package:keep_it/core/utils/styles/app_colors.dart';

import 'package:keep_it/core/utils/styles/app_paddings.dart';
import 'package:keep_it/core/utils/styles/app_strings.dart';
import 'package:keep_it/core/utils/styles/app_styles_text.dart';
import 'package:keep_it/features/home/view/widget/home_screen.dart';

class IntroductionSlidingGoButton extends StatelessWidget {
  const IntroductionSlidingGoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          navigationFunction(widget: const HomeScreen(), context: context),
      child: const DecoratedBox(
        decoration: BoxDecoration(
            color: AppColors.blueLight,
            borderRadius: BorderRadius.all(AppBorderRadius.circular25)),
        child: Padding(
          padding: AppPaddings.introGoButton,
          child: Text(
            AppStrings.introLetsGo,
            style: AppTextStyles.text18,
          ),
        ),
      ),
    );
  }
}
