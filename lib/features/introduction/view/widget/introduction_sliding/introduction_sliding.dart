import 'package:flutter/material.dart';
import 'package:keep_it/core/utils/styles/app_dimension.dart';

import 'Introduction_sliding_button_body.dart';
import 'introduction_sliding_indicator.dart';

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
