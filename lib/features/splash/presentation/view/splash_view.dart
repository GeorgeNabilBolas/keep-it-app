import 'package:flutter/material.dart';

import '../../../home page/presentation/view/home_page.dart';
import 'widget/splash_animation.dart';
import 'widget/splash_primary_widget.dart';
import 'widget/splash_secondary_widget.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Flexible(
            fit: FlexFit.tight,
            child: SplashPrimaryWidget(),
          ),
          Flexible(
            child: SplashAnimation(
              child: const SplashSecondaryWidget(),
              onEnd: () {
                return Future.delayed(const Duration(milliseconds: 500), () {
                  Navigator.of(context).push(buildRoute());
                });
              },
            ),
          )
        ],
      ),
    );
  }

  PageRouteBuilder<dynamic> buildRoute() {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => const HomePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final Tween<double> tween = Tween(begin: 0, end: 1);
        return FadeTransition(
          opacity: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
