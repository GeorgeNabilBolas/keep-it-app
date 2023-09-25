// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/methods/navigation_method.dart';
import '../../../../core/utils/styles/app_durations.dart';
import '../../../../core/utils/styles/app_info.dart';
import '../../../../core/utils/styles/app_strings.dart';
import '../../../../core/utils/styles/app_styles_text.dart';
import '../../../home_page/view/home_page.dart';
import '../../../introduction/view/introduction_page.dart';
import '../../../../core/utils/models/typewriter_animated_model.dart';
import '../../../../core/utils/widgets/typewriter_animated_text.dart';

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
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          bool isFirstRun = prefs.getBool('isFirstRun') ?? true;
          await navigationFunction(
            delay: AppDurations.durationSec1,
            context: context,
            widget: isFirstRun ? const IntroductionPage() : const HomePage(),
          );
        },
      ),
    );
  }
}
