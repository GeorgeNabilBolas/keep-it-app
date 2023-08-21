import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_it/core/utils/styles/app_colors.dart';

import '../../../core/utils/methods/system_ui_overlay_style.dart';
import '../view-model/sliding_cubit.dart';
import 'widget/introduction_screen.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});
  @override
  Widget build(BuildContext context) {
    systemUiOverlayStyle(AppColors.blueLight);

    return BlocProvider<SlidingCubit>(
      create: (context) => SlidingCubit(),
      child: const Scaffold(
        body: IntroductionScreen(),
      ),
    );
  }
}
