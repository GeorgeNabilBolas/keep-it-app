import 'package:flutter/cupertino.dart';
import 'package:keep_it/core/utils/styles/app_paddings.dart';
import 'package:keep_it/core/utils/styles/app_styles_text.dart';

class IntroductionBodyContentSubtitle extends StatelessWidget {
  const IntroductionBodyContentSubtitle({
    super.key,
    required this.subtitle,
  });
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.introSubtitle,
      child: Text(
        subtitle,
        style: AppTextStyles.text22,
        textAlign: TextAlign.center,
      ),
    );
  }
}
