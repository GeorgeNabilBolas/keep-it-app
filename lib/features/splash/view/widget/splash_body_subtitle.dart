import 'package:flutter/material.dart';
import 'package:keep_it/core/utils/styles.dart';

class SplashBodySubtitle extends StatelessWidget {
  const SplashBodySubtitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'BY\nGEORGE NABIL',
      style: Styles.labelSmall,
      textAlign: TextAlign.center,
    );
  }
}
