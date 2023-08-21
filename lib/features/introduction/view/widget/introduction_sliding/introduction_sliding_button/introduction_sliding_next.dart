import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/styles/app_decorations.dart';
import '../../../../../../core/utils/styles/app_paddings.dart';
import '../../../../../../core/utils/styles/app_strings.dart';
import '../../../../../../core/utils/styles/app_styles_text.dart';
import '../../../../view-model/sliding_cubit.dart';

class IntroductionSlidingNextButton extends StatelessWidget {
  const IntroductionSlidingNextButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var cubitData = BlocProvider.of<SlidingCubit>(context);
    return GestureDetector(
      onTap: () => cubitData.slidingOrder(order: SlidingOrders.next),
      child: Container(
        padding: AppPaddings.introNextButton,
        decoration: AppDecorations.introNext,
        child: const Text(
          AppStrings.introNext,
          style: AppTextStyles.text18,
        ),
      ),
    );
  }
}
