import 'package:flutter/material.dart';

class IntroPageViewImage extends StatelessWidget {
  const IntroPageViewImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 4,
      child: Image.asset(
        'assets/images/intro/intro1.png',
      ),
    );
  }
}
