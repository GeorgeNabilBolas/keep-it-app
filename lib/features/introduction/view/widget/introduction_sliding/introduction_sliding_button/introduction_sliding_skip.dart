import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/styles/app_colors.dart';
import '../../../../../../core/utils/styles/app_paddings.dart';
import '../../../../../../core/utils/styles/app_strings.dart';
import '../../../../../../core/utils/styles/app_decorations.dart';
import '../../../../../../core/utils/styles/app_styles_text.dart';
import '../../../../view-model/sliding_cubit.dart';

class IntroductionSlidingskipButton extends StatelessWidget {
  const IntroductionSlidingskipButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var cubitData = BlocProvider.of<SlidingCubit>(context);

    return GestureDetector(
      onTap: () => cubitData.slidingOrder(order: SlidingOrders.skip),
      child: Container(
        padding: AppPaddings.introSkipButton,
        decoration: AppDecorations.introSkip,
        child: Text(
          AppStrings.introSkip,
          style: AppTextStyles.text18.copyWith(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
