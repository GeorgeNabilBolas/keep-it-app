import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DialogImage extends StatelessWidget {
  const DialogImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      height: 200,
    );
  }
}
