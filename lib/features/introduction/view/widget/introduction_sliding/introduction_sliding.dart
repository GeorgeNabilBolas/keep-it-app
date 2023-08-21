import 'package:flutter/material.dart';

import '../../../../../core/utils/styles/app_dimension.dart';
import 'introduction_sliding_button/introduction_sliding_button.dart';
import 'introduction_sliding_indicator/introduction_sliding_indicator.dart';

class IntroductionSliding extends StatelessWidget {
  const IntroductionSliding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        IntroductionSlidingIndicator(),
        SizedBox(height: AppDimension.introIndicatorAndButtonSpacing),
        IntroductionSlidingButton(),
      ],
    );
  }
}
