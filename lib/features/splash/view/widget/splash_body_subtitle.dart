import 'package:flutter/material.dart';
import 'package:keep_it/core/utils/app_strings.dart';
import 'package:keep_it/core/utils/app_styles_text.dart';

class SplashBodySubtitle extends StatelessWidget {
  const SplashBodySubtitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      AppStrings.directedBy,
      style: AppTextStyles.text12,
      textAlign: TextAlign.center,
    );
  }
}
