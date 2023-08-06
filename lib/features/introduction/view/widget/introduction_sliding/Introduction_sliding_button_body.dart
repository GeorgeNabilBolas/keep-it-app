import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_it/core/utils/styles/app_info.dart';
import 'package:keep_it/core/utils/styles/app_paddings.dart';
import 'package:keep_it/features/introduction/view-model/sliding_cubit.dart';
import 'package:keep_it/features/introduction/view-model/sliding_states.dart';
import 'Introduction_sliding_go.dart';
import 'Introduction_sliding_skip.dart';
import 'Introduction_sliding_next.dart';

class IntroductionSlidingButton extends StatelessWidget {
  const IntroductionSlidingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SlidingCubit, SlidingState>(builder: (context, state) {
      if (BlocProvider.of<SlidingCubit>(context).pageNumber ==
          AppInfo.numberOfIntroPages - 1) {
        return const Padding(
          padding: AppPaddings.introButtonsSpacing,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IntroductionSlidingGoButton(),
            ],
          ),
        );
      } else {
        return const Padding(
          padding: AppPaddings.introButtonsSpacing,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IntroductionSlidingskipButton(),
              IntroductionSlidingNextButton(),
            ],
          ),
        );
      }
    });
  }
}
