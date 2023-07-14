import 'package:flutter/material.dart';

import 'package:keep_it/core/utils/app_paddings.dart';

import 'intro_sliding_button.dart';

class IntroSlidingButtonBody extends StatelessWidget {
  const IntroSlidingButtonBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: AppPaddings.vertical8,
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
