import 'package:flutter/material.dart';

import '../../../../../../../core/utils/styles/app_colors.dart';
import '../../../../../../../core/utils/styles/app_styles_text.dart';

class DialogTitle extends StatelessWidget {
  const DialogTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Text(
        textAlign: TextAlign.center,
        title,
        style: AppTextStyles.text22.copyWith(color: AppColors.primaryColor),
      ),
    );
  }
}
