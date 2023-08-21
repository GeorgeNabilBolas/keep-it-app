// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../core/utils/methods/navigation_method.dart';
import '../../../../../../core/utils/styles/app_decorations.dart';
import '../../../../../../core/utils/styles/app_paddings.dart';
import '../../../../../../core/utils/styles/app_strings.dart';
import '../../../../../../core/utils/styles/app_styles_text.dart';
import '../../../../../home_page/view/home_page.dart';

class IntroductionSlidingGoButton extends StatelessWidget {
  const IntroductionSlidingGoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isFirstRun', false);
        navigationFunction(widget: const HomePage(), context: context);
      },
      child: Container(
        padding: AppPaddings.introGoButton,
        decoration: AppDecorations.introGo,
        child: const Text(AppStrings.introLetsGo, style: AppTextStyles.text18),
      ),
    );
  }
}
