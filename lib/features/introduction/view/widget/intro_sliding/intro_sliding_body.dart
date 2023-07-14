import 'package:flutter/material.dart';

import 'intro_sliding_button_body.dart';
import 'intro_sliding_indicator_bodu.dart';

class IntorSlidingBody extends StatelessWidget {
  const IntorSlidingBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        IntroSlidingIndicatorBody(),
        IntroSlidingButtonBody(),
      ],
    );
  }
}
