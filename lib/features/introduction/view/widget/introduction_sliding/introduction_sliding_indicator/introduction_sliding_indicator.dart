import 'package:flutter/material.dart';

import '../../../../../../core/utils/styles/app_dimension.dart';
import '../../../../../../core/utils/styles/app_info.dart';
import 'introduction_sliding_Indicator_builder.dart';

class IntroductionSlidingIndicator extends StatelessWidget {
  const IntroductionSlidingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimension.introSlidingIndicatorRadius,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: AppInfo.numberOfIntroPages,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return IntroductionSlidingIndicatiorBuilder(index: index);
        },
      ),
    );
  }
}
