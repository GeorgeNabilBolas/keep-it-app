import 'package:flutter/cupertino.dart';

import 'intro_page_view_image.dart';
import 'intro_page_view_subtitle.dart';
import 'intro_page_view_title.dart';

class IntroPageViewContent extends StatelessWidget {
  const IntroPageViewContent({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        IntroPageViewImage(),
        IntroPageViewTitle(),
        IntroPageViewSubtitle(),
      ],
    );
  }
}
