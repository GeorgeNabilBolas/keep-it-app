import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/styles/app_info.dart';
import '../../../../../../core/utils/styles/app_paddings.dart';
import '../../../../view-model/sliding_cubit.dart';
import '../../../../view-model/sliding_states.dart';
import 'Introduction_sliding_go.dart';
import 'introduction_sliding_next.dart';
import 'introduction_sliding_skip.dart';

class IntroductionSlidingButton extends StatelessWidget {
  const IntroductionSlidingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SlidingCubit, SlidingState>(
      builder: (context, state) {
        var cubitData = BlocProvider.of<SlidingCubit>(context);
        if (cubitData.pageNumber == AppInfo.numberOfIntroPages - 1) {
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
      },
    );
  }
}
