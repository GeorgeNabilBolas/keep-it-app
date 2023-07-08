import 'package:flutter/material.dart';

import 'package:keep_it/constants.dart';

class IntroSlidingIndicatorWidget extends StatelessWidget {
  const IntroSlidingIndicatorWidget({
    super.key,
    required this.isTheCurrentPage,
  });
  final bool isTheCurrentPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: AnimatedContainer(
        duration: kTransitionDuration,
        decoration: BoxDecoration(
            color: isTheCurrentPage ? kColor1 : kColor2,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: AnimatedSize(
          duration: kTransitionDuration,
          child: SizedBox(
            width: isTheCurrentPage ? 25 : 8,
            height: 8,
          ),
        ),
      ),
    );
  }
}
