import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_it/features/introduction/view-model/sliding_cubit.dart';

import 'Introduction_body/Introduction_body.dart';
import 'introduction_sliding/introduction_sliding.dart';
import 'introduction_appbar/introduction_appbar.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SlidingCubit>(
      create: (context) => SlidingCubit(),
      child: const Scaffold(
        body: Stack(
          children: [
            IntroductionAppBar(),
            Column(
              children: [
                IntroductionBody(),
                IntroductionSliding(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
