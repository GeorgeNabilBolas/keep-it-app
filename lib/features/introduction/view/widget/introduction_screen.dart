import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_it/bloc.dart';

import 'intro_body/intro_body.dart';
import 'intro_sliding_control/intro_sliding_control.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SlidingCubit>(
      create: (context) => SlidingCubit(),
      child: const Scaffold(
        body: Column(
          children: [
            IntroPageViewBody(),
            IntorSlidingBody(),
          ],
        ),
      ),
    );
  }
}