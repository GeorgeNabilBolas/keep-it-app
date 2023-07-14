import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_it/bloc.dart';
import 'package:keep_it/core/utils/app_info.dart';

import 'intro_sliding_Indicator_widget.dart';

class IntroSlidingIndicatorBody extends StatelessWidget {
  const IntroSlidingIndicatorBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppInfo.slidingIndicatorRadius,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: AppInfo.numberOfIntroPages,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return BlocBuilder<SlidingCubit, SlidingState>(
            builder: (context, state) {
              bool isTheCurrentPage =
                  BlocProvider.of<SlidingCubit>(context).slidingNum == index;

              return IntroSlidingIndicatorWidget(
                isTheCurrentPage: isTheCurrentPage,
              );
            },
          );
        },
      ),
    );
  }
}
