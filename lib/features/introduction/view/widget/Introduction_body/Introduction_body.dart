import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles/app_durations.dart';
import '../../../../../core/utils/styles/app_info.dart';
import '../../../view-model/sliding_cubit.dart';
import '../../../view-model/sliding_states.dart';
import 'introduction_body_builder.dart';

class IntroductionBody extends StatelessWidget {
  const IntroductionBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var slidingCubit = BlocProvider.of<SlidingCubit>(context);
    PageController controller = PageController();
    return Expanded(
      child: BlocListener<SlidingCubit, SlidingState>(
        listener: (context, state) async => await listenerMethod(
          state: state,
          controller: controller,
          slidingCubit: slidingCubit,
        ),
        child: IntroductionBodyBuilder(controller: controller),
      ),
    );
  }

  Future<void> listenerMethod({
    required SlidingState state,
    required PageController controller,
    required SlidingCubit slidingCubit,
  }) async {
    if (state is SlidingSkip) {
      await animateToPage(
        controller: controller,
        numberOfPage: AppInfo.numberOfIntroPages - 1,
      );
    } else if (state is SlidingNext) {
      await animateToPage(
        controller: controller,
        numberOfPage: slidingCubit.pageNumber + 1,
      );
    }
  }

  Future<void> animateToPage({
    required PageController controller,
    required int numberOfPage,
  }) async {
    return await controller.animateToPage(
      numberOfPage,
      duration: AppDurations.durationMilli300,
      curve: Curves.linear,
    );
  }
}
