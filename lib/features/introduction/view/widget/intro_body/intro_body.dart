import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_it/bloc.dart';
import 'package:keep_it/constants.dart';

import 'intro_body_content.dart';

class IntroPageViewBody extends StatelessWidget {
  const IntroPageViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SlidingCubit slidingCubit = BlocProvider.of<SlidingCubit>(context);
    PageController controller = PageController(initialPage: 0);

    return Expanded(
      child: BlocListener<SlidingCubit, SlidingState>(
        listener: (context, state) {
          if (slidingCubit.slidingNum == kNumberOfPages - 1) {
            animateToPage(controller);
          }
        },
        child: PageView.builder(
            controller: controller,
            onPageChanged: (value) => slidingCubit.slidingNum = value,
            itemCount: kNumberOfPages,
            itemBuilder: (context, index) {
              return IntroPageViewContent(index: slidingCubit.slidingNum);
            }),
      ),
    );
  }

  Future<void> animateToPage(PageController controller) async {
    return await controller.animateToPage(
      3,
      duration: kTransitionDuration,
      curve: Curves.linear,
    );
  }
}
