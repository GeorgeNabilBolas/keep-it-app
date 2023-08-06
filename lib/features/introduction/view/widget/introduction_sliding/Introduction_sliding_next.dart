import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_it/features/introduction/view-model/sliding_cubit.dart';
import 'package:keep_it/core/utils/styles/app_paddings.dart';
import 'package:keep_it/core/utils/styles/app_strings.dart';
import 'package:keep_it/core/utils/styles/app_styles_button.dart';
import 'package:keep_it/core/utils/styles/app_styles_text.dart';

class IntroductionSlidingNextButton extends StatelessWidget {
  const IntroductionSlidingNextButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => BlocProvider.of<SlidingCubit>(context)
          .slidingOrder(order: SlidingOrders.next),
      child: Container(
        padding: AppPaddings.introNextButton,
        decoration: AppButtonStyles.introNext,
        child: const Text(
          AppStrings.introNext,
          style: AppTextStyles.text18,
        ),
      ),
    );
  }
}
