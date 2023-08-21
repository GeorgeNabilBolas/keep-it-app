import 'package:flutter/material.dart';
import 'package:keep_it/core/utils/styles/app_decorations.dart';

import '../../../../../core/utils/styles/app_paddings.dart';
import '../../../../../core/utils/styles/app_styles_text.dart';

class IntroductionBodyContentTitle extends StatelessWidget {
  const IntroductionBodyContentTitle({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.introTitle,
      decoration: AppDecorations.introTitle,
      child: Text(
        title,
        style: AppTextStyles.text30,
      ),
    );
  }
}
