import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../view-model/sliding_cubit.dart';
import '../../../../view-model/sliding_states.dart';
import 'introduction_sliding_Indicator_widget.dart';

class IntroductionSlidingIndicatiorBuilder extends StatelessWidget {
  const IntroductionSlidingIndicatiorBuilder({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SlidingCubit, SlidingState>(
      builder: (context, state) {
        bool isTheCurrentPage =
            BlocProvider.of<SlidingCubit>(context).pageNumber == index;

        return IntroductionSlidingIndicatorWidget(
          isTheCurrentPage: isTheCurrentPage,
        );
      },
    );
  }
}
