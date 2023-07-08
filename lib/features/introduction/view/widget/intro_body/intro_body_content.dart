import 'package:flutter/cupertino.dart';

import 'intro_body_image.dart';
import 'intro_body_subtitle.dart';
import 'intro_body_title.dart';

class IntroPageViewContent extends StatelessWidget {
  const IntroPageViewContent({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IntroPageViewImage(),
        IntroPageViewTitle(),
        IntroPageViewSubtitle(),
      ],
    );
  }
}
