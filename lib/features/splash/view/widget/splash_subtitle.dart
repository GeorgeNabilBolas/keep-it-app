import 'package:flutter/material.dart';

import '../../../../core/utils/styles/app_strings.dart';
import '../../../../core/utils/styles/app_styles_text.dart';

class SplashSubtitle extends StatelessWidget {
  const SplashSubtitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      AppStrings.introBy,
      style: AppTextStyles.text12,
      textAlign: TextAlign.center,
    );
  }
}
