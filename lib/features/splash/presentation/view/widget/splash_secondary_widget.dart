import 'package:flutter/material.dart';

class SplashSecondaryWidget extends StatelessWidget {
  const SplashSecondaryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'BY\nGEORGE NABIL',
      style: Theme.of(context).textTheme.labelSmall,
      textAlign: TextAlign.center,
    );
  }
}
