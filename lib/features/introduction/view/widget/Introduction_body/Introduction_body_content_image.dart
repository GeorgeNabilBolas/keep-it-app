import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IntroductionBodyContentImage extends StatelessWidget {
  const IntroductionBodyContentImage({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
    );
  }
}
