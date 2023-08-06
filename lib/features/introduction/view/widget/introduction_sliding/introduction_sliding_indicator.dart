import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_it/features/introduction/view-model/sliding_cubit.dart';
import 'package:keep_it/core/utils/styles/app_info.dart';

import '../../../view-model/sliding_states.dart';
import 'introduction_sliding_Indicator_widget.dart';

class IntroductionSlidingIndicator extends StatelessWidget {
  const IntroductionSlidingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppInfo.slidingIndicatorRadius,
      child: SizedBox(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: AppInfo.numberOfIntroPages,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return BlocBuilder<SlidingCubit, SlidingState>(
              builder: (context, state) {
                bool isTheCurrentPage =
                    BlocProvider.of<SlidingCubit>(context).pageNumber == index;

                return IntroductionSlidingIndicatorWidget(
                  isTheCurrentPage: isTheCurrentPage,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
