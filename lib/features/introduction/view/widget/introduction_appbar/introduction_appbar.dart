import 'package:flutter/material.dart';
import 'package:keep_it/core/utils/styles/app_decorations.dart';
import 'package:keep_it/core/utils/styles/app_dimension.dart';

class IntroductionAppBar extends StatelessWidget {
  const IntroductionAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height / AppDimension.introAppBarHeight,
      decoration: AppDecorations.introAppBar(size),
    );
  }
}
