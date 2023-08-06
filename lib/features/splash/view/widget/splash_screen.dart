import 'package:flutter/material.dart';

import 'splash_subtitle.dart';
import 'splash_title.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: SplashTitle(),
        ),
        Flexible(
          child: SplashSubtitle(),
        )
      ],
    );
  }
}
