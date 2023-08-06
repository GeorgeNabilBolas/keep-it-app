import 'package:flutter/material.dart';
import 'package:keep_it/core/utils/styles/app_colors.dart';

class IntroductionAppBar extends StatelessWidget {
  const IntroductionAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.2,
      decoration: BoxDecoration(
        color: AppColors.blueLight,
        borderRadius: BorderRadiusDirectional.vertical(
          bottom: Radius.elliptical(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height / 3,
          ),
        ),
      ),
    );
  }
}
