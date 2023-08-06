import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_it/features/introduction/view-model/sliding_cubit.dart';
import 'package:keep_it/core/utils/styles/app_durations.dart';
import 'package:keep_it/core/utils/styles/app_images.dart';
import 'package:keep_it/core/utils/styles/app_info.dart';
import 'package:keep_it/core/utils/styles/app_strings.dart';
import 'package:keep_it/features/introduction/model/intro_model.dart';

import '../../../view-model/sliding_states.dart';
import 'Introduction_body_content.dart';

class IntroductionBody extends StatelessWidget {
  const IntroductionBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SlidingCubit slidingCubit = BlocProvider.of<SlidingCubit>(context);
    PageController controller = PageController();
    return Expanded(
      child: BlocConsumer<SlidingCubit, SlidingState>(
        listener: (context, state) async {
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
        },
        builder: (context, state) => PageView.builder(
          physics: const BouncingScrollPhysics(),
          controller: controller,
          onPageChanged: (value) => slidingCubit.slidingOrder(
            order: SlidingOrders.onPageChanged,
            value: value,
          ),
          itemCount: AppInfo.numberOfIntroPages,
          itemBuilder: (context, index) {
            return AnimatedOpacity(
              duration: AppDurations.durationMilli300,
              opacity: slidingCubit.pageNumber == index ? 1 : 0,
              child: IntroductionBodyContent(
                introModel: IntroModel(
                  title: AppStrings.introTitle[index],
                  subtitle: AppStrings.introSubtitle[index],
                  image: AppImages.introImage[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> animateToPage(
      {required PageController controller, required int numberOfPage}) async {
    return await controller.animateToPage(
      numberOfPage,
      duration: AppDurations.durationMilli300,
      curve: Curves.linear,
    );
  }
}
