import 'package:flutter/material.dart';
import 'package:keep_it/core/utils/methods/navigation_method.dart';
import 'package:keep_it/core/utils/styles/app_durations.dart';
import 'package:keep_it/core/utils/styles/app_info.dart';
import 'package:keep_it/core/utils/styles/app_strings.dart';
import 'package:keep_it/core/utils/styles/app_styles_text.dart';
import 'package:keep_it/features/introduction/view/introduction_page.dart';
import 'package:keep_it/features/splash/model/typewriter_animated_model.dart';

import 'typewriter_animated_text.dart';

class SplashTitle extends StatelessWidget {
  const SplashTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TypewriterAnimatedText(
      typeWriterModel: TypeWriterAnimatedModel(
        duration: AppDurations.durationSec3,
        indicatorPulsesNum: AppInfo.numberOfTypeWriterPulses,
        text: AppStrings.introKeepIt,
        indicatorShape: AppStrings.introIndicatorShape,
        style: AppTextStyles.text40,
        onEnd: () async {
          await navigationFunction(
            delay: AppDurations.durationSec1,
            context: context,
            widget: const IntroductionPage(),
          );
        },
      ),
    );
  }
}
