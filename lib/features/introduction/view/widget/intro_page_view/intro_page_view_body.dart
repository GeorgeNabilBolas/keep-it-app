import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_it/bloc.dart';
import 'package:keep_it/core/utils/app_durations.dart';
import 'package:keep_it/core/utils/app_info.dart';

import 'intro_page_view_content.dart';

class IntroPageViewBody extends StatelessWidget {
  const IntroPageViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SlidingCubit slidingCubit = BlocProvider.of<SlidingCubit>(context);
    PageController controller = PageController();

    return Expanded(
      child: BlocListener<SlidingCubit, SlidingState>(
        listener: (context, state) {
          if (slidingCubit.slidingNum == AppInfo.numberOfIntroPages - 1) {
            animateToPage(controller);
          }
        },
        child: PageView.builder(
            controller: controller,
            onPageChanged: (value) => slidingCubit.slidingNum = value,
            itemCount: AppInfo.numberOfIntroPages,
            itemBuilder: (context, index) {
              return IntroPageViewContent(index: slidingCubit.slidingNum);
            }),
      ),
    );
  }

  Future<void> animateToPage(PageController controller) async {
    return await controller.animateToPage(
      AppInfo.numberOfIntroPages - 1,
      duration: AppDurations.durationMilli300,
      curve: Curves.linear,
    );
  }
}
