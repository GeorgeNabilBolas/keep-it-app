import 'package:flutter/material.dart';

class SplashPrimaryWidget extends StatelessWidget {
  const SplashPrimaryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'KEEP IT.',
      style: Theme.of(context).textTheme.titleLarge,
      textAlign: TextAlign.center,
    );
  }
}
