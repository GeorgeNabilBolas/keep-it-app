import 'package:flutter/cupertino.dart';
import 'package:keep_it/core/utils/styles.dart';

class IntroPageViewSubtitle extends StatelessWidget {
  const IntroPageViewSubtitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        'Your phone will be kept with serin sound effect To warn you of theft',
        style: Styles.labelMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
