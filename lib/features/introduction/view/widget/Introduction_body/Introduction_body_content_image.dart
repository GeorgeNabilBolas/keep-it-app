import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/styles/app_dimension.dart';

class IntroductionBodyContentImage extends StatelessWidget {
  const IntroductionBodyContentImage({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height / AppDimension.introAppBarHeight,
      width: size.width * .6,
      child: SvgPicture.asset(
        image,
      ),
    );
  }
}
