import 'package:flutter/material.dart';

import 'splash_body_subtitle.dart';
import 'splash_body_title.dart';

class SplashViewScreen extends StatelessWidget {
  const SplashViewScreen({
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
          child: SplashBodyTitle(),
        ),
        Flexible(
          child: SplashBodySubtitle(),
        )
      ],
    );
  }
}
