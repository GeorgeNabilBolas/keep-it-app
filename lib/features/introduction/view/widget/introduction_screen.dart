import 'package:flutter/material.dart';

import 'Introduction_body/introduction_body.dart';
import 'introduction_sliding/introduction_sliding.dart';
import 'introduction_appbar/introduction_appbar.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        IntroductionAppBar(),
        Column(
          children: [
            IntroductionBody(),
            IntroductionSliding(),
          ],
        ),
      ],
    );
  }
}
