import 'package:flutter/material.dart';

import '../../../../../core/utils/styles/app_colors.dart';
import '../../../../../core/utils/styles/app_strings.dart';
import '../../../../../core/utils/styles/app_styles_text.dart';

class HomeAppBarBody extends StatelessWidget {
  const HomeAppBarBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      height: MediaQuery.of(context).size.height / 5,
      decoration: BoxDecoration(
        color: AppColors.blueMedium,
        borderRadius: BorderRadiusDirectional.vertical(
          bottom: Radius.elliptical(
            size.width,
            size.height / 5,
          ),
        ),
      ),
      child: Center(
        child: Text(
          AppStrings.introKeepIt,
          style: AppTextStyles.text40.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
