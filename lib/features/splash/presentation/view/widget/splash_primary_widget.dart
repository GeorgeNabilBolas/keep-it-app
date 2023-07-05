import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../home page/presentation/view/home_page.dart';
import 'typewriter_animated_text.dart';

class SplashPrimaryWidget extends StatelessWidget {
  const SplashPrimaryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TypewriterAnimatedText(
      duration: const Duration(milliseconds: 2500),
      indicatorPulsesNum: 3,
      text: 'KEEP IT.',
      indicatorShape: '_',
      style: Theme.of(context).textTheme.titleLarge,
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
      pageBuilder: (_, __, ___) => const HomePage(),
      transitionsBuilder: (context, animation, _, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
