import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles/app_durations.dart';
import '../../../../../core/utils/styles/app_images.dart';
import '../../../../../core/utils/styles/app_info.dart';
import '../../../../../core/utils/styles/app_strings.dart';
import '../../../model/intro_model.dart';
import '../../../view-model/sliding_cubit.dart';
import '../../../view-model/sliding_states.dart';
import 'Introduction_body_content.dart';

class IntroductionBodyBuilder extends StatelessWidget {
  const IntroductionBodyBuilder({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SlidingCubit, SlidingState>(
      builder: (context, state) {
        var slidingCubit = BlocProvider.of<SlidingCubit>(context);
        return PageView.builder(
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
        );
      },
    );
  }
}
