import 'package:flutter/material.dart';

import '../../../../../../core/utils/styles/app_decorations.dart';
import '../../../../../../core/utils/styles/app_dimension.dart';
import '../../../../../../core/utils/styles/app_durations.dart';
import '../../../../../../core/utils/styles/app_paddings.dart';

class IntroductionSlidingIndicatorWidget extends StatelessWidget {
  const IntroductionSlidingIndicatorWidget({
    super.key,
    required this.isTheCurrentPage,
  });
  final bool isTheCurrentPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.introIndicatroSpacing,
      child: AnimatedContainer(
        duration: AppDurations.durationMilli300,
        decoration: isTheCurrentPage
            ? AppDecorations.introSlidingIndicatorDark
            : AppDecorations.introSlidingIndicatorLight,
        child: AnimatedSize(
          duration: AppDurations.durationMilli300,
          child: SizedBox(
            height: AppDimension.introSlidingIndicatorRadius,
            width: isTheCurrentPage
                ? 2.5 * AppDimension.introSlidingIndicatorRadius
                : AppDimension.introSlidingIndicatorRadius,
          ),
        ),
      ),
    );
  }
}
