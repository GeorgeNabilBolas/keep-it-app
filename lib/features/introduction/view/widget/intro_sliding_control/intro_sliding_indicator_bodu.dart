import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_it/bloc.dart';

import 'intro_sliding_Indicator.dart';

class IntroSlidingIndicatorBody extends StatelessWidget {
  const IntroSlidingIndicatorBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
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
