import 'package:flutter/material.dart';

import 'intro_sliding_button.dart';

class IntroSlidingButtonBody extends StatelessWidget {
  const IntroSlidingButtonBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IntroSlidingButtonWidget(isSkip: true),
          IntroSlidingButtonWidget(isSkip: false),
        ],
      ),
    );
  }
}
