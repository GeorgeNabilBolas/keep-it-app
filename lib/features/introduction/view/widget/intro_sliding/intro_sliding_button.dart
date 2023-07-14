import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_it/bloc.dart';
import 'package:keep_it/core/utils/app_colors.dart';
import 'package:keep_it/core/utils/app_info.dart';
import 'package:keep_it/core/utils/app_paddings.dart';
import 'package:keep_it/core/utils/app_strings.dart';
import 'package:keep_it/core/utils/app_styles_button.dart';
import 'package:keep_it/core/utils/app_styles_text.dart';

class IntroSlidingButtonWidget extends StatelessWidget {
  const IntroSlidingButtonWidget({
    super.key,
    required this.isSkip,
  });
  final bool isSkip;
  @override
  Widget build(BuildContext context) {
    if (isSkip) {
      return GestureDetector(
        onTap: () {
          BlocProvider.of<SlidingCubit>(context).slidingNum =
              AppInfo.numberOfIntroPages - 1;
        },
        child: Container(
          padding: AppPaddings.skipButton,
          decoration: AppButtonStyles.skip,
          child: Text(
            AppStrings.skip,
            style: AppTextStyles.textNormal18.copyWith(color: AppColors.light),
          ),
        ),
      );
    } else {
      return Container(
        padding: AppPaddings.nextButton,
        decoration: AppButtonStyles.next,
        child: const Text(
          AppStrings.next,
          style: AppTextStyles.textNormal18,
        ),
      );
    }
  }
}
