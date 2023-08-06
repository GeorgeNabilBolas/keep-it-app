import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_it/features/introduction/view-model/sliding_cubit.dart';
import 'package:keep_it/core/utils/styles/app_colors.dart';
import 'package:keep_it/core/utils/styles/app_paddings.dart';
import 'package:keep_it/core/utils/styles/app_strings.dart';
import 'package:keep_it/core/utils/styles/app_styles_button.dart';
import 'package:keep_it/core/utils/styles/app_styles_text.dart';

class IntroductionSlidingskipButton extends StatelessWidget {
  const IntroductionSlidingskipButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => BlocProvider.of<SlidingCubit>(context)
          .slidingOrder(order: SlidingOrders.skip),
      child: Container(
        padding: AppPaddings.introSkipButton,
        decoration: AppButtonStyles.introSkip,
        child: Text(
          AppStrings.introSkip,
          style: AppTextStyles.text18.copyWith(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
