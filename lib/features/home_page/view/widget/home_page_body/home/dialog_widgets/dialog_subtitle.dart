import 'package:flutter/material.dart';

import '../../../../../../../core/utils/styles/app_styles_text.dart';

class DialogSubTitle extends StatelessWidget {
  const DialogSubTitle({
    super.key,
    required this.subTitle,
  });

  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      child: Text(
        textAlign: TextAlign.center,
        subTitle,
        style: AppTextStyles.text14,
      ),
    );
  }
}
