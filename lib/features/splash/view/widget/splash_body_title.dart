import 'package:flutter/material.dart';
import 'package:keep_it/core/utils/app_durations.dart';
import 'package:keep_it/core/utils/app_info.dart';
import 'package:keep_it/core/utils/app_strings.dart';
import 'package:keep_it/core/utils/app_styles_text.dart';
import 'package:keep_it/features/introduction/view/introduction_page.dart';

import 'typewriter_animated_text.dart';

class SplashBodyTitle extends StatelessWidget {
  const SplashBodyTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TypewriterAnimatedText(
      duration: AppDurations.durationSec3,
      indicatorPulsesNum: AppInfo.numberOfTypeWriterPulses,
      text: AppStrings.keepIt,
      indicatorShape: AppStrings.indicatorShape,
      style: AppTextStyles.text40,
      onEnd: () => navigationFunction(context),
    );
  }
//////////////////set navigationFunction methode/////////////////////////////////

  Future<dynamic> navigationFunction(BuildContext context) {
    return Future.delayed(
      AppDurations.durationSec1,
      () => Navigator.of(context).pushReplacement(
        buildRoute(),
      ),
    );
  }

  PageRouteBuilder<dynamic> buildRoute() {
    return PageRouteBuilder(
      transitionDuration: AppDurations.durationMilli300,
      pageBuilder: (_, __, ___) => const IntroductionPage(),
      transitionsBuilder: (context, animation, _, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
