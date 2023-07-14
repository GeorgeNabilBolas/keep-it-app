import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_it/bloc.dart';

import 'intro_page_view/intro_page_view_body.dart';
import 'intro_sliding/intro_sliding_body.dart';

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
