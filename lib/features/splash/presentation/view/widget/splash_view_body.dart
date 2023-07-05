import 'package:flutter/material.dart';

import 'splash_primary_widget.dart';
import 'splash_secondary_widget.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({
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
          child: SplashPrimaryWidget(),
        ),
        Flexible(
          flex: 1,
          child: SplashSecondaryWidget(),
        )
      ],
    );
  }
}
