import 'package:flutter/material.dart';
import 'package:keep_it/core/utils/app_border_radius.dart';
import 'package:keep_it/core/utils/app_colors.dart';
import 'package:keep_it/core/utils/app_durations.dart';
import 'package:keep_it/core/utils/app_info.dart';
import 'package:keep_it/core/utils/app_paddings.dart';

class IntroSlidingIndicatorWidget extends StatelessWidget {
  const IntroSlidingIndicatorWidget({
    super.key,
    required this.isTheCurrentPage,
  });
  final bool isTheCurrentPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.horizontal8,
      child: AnimatedContainer(
        duration: AppDurations.durationMilli300,
        decoration: BoxDecoration(
          color: isTheCurrentPage ? AppColors.dark : AppColors.light,
          borderRadius: const BorderRadius.all(AppBorderRadius.circular25),
        ),
        child: AnimatedSize(
          duration: AppDurations.durationMilli300,
          child: SizedBox(
            height: AppInfo.slidingIndicatorRadius,
            width: isTheCurrentPage
                ? 2.5 * AppInfo.slidingIndicatorRadius
                : AppInfo.slidingIndicatorRadius,
          ),
        ),
      ),
    );
  }
}
