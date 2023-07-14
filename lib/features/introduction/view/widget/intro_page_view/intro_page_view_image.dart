import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keep_it/core/utils/app_images.dart';

class IntroPageViewImage extends StatelessWidget {
  const IntroPageViewImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SvgPicture.asset(
        fit: BoxFit.fitWidth,
        AppImages.intro[0],
      ),
    );
  }
}
