import 'package:flutter/material.dart';
import 'package:keep_it/constants.dart';
import 'package:keep_it/core/utils/styles.dart';

class IntroPageViewTitle extends StatelessWidget {
  const IntroPageViewTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
          color: kColor2, borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Relax',
          style: Styles.labelLarge,
        ),
      ),
    );
  }
}
