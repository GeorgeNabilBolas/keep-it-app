import 'package:flutter/material.dart';
import 'package:keep_it/constants.dart';
import 'package:keep_it/core/utils/styles.dart';
import 'package:keep_it/features/introduction/view/introduction_page.dart';

import 'typewriter_animated_text.dart';

class SplashBodyTitle extends StatelessWidget {
  const SplashBodyTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TypewriterAnimatedText(
      duration: const Duration(seconds: 3),
      indicatorPulsesNum: 5,
      text: 'KEEP IT.',
      indicatorShape: '_',
      style: Styles.titleLarge,
      onEnd: () => navigationFunction(context),
    );
  }
//////////////////set navigationFunction methode/////////////////////////////////

  Future<dynamic> navigationFunction(BuildContext context) {
    return Future.delayed(
      const Duration(seconds: 1),
      () => Navigator.of(context).pushReplacement(
        buildRoute(),
      ),
    );
  }

  PageRouteBuilder<dynamic> buildRoute() {
    return PageRouteBuilder(
      transitionDuration: kTransitionDuration,
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
