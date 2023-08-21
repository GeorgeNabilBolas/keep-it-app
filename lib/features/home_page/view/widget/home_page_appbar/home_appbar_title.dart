import 'package:flutter/cupertino.dart';

import '../../../../../../core/utils/styles/app_colors.dart';
import '../../../../../../core/utils/styles/app_strings.dart';
import '../../../../../../core/utils/styles/app_styles_text.dart';

class HomeAppBarTitle extends StatelessWidget {
  const HomeAppBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.introKeepIt,
        style: AppTextStyles.text40.copyWith(
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
