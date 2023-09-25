import 'package:flutter/material.dart';

import '../models/typewriter_animated_model.dart';

class TypewriterAnimatedText extends StatelessWidget {
  const TypewriterAnimatedText({
    super.key,
    required this.typeWriterModel,
  });

  final TypeWriterAnimatedModel typeWriterModel;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: typeWriterModel.duration,
      tween: StepTween(
        begin: 0,
        end: typeWriterModel.text.length +
            2 * typeWriterModel.indicatorPulsesNum,
      ),
      builder: (context, steps, child) {
        return Padding(
          padding: typeWriterModel.isLeftToRight == true
              ? EdgeInsets.all(0)
              : textPadding(context),
          child: Text(
            showText(steps),
            style: typeWriterModel.style,
          ),
        );
      },
      onEnd: typeWriterModel.onEnd,
    );
  }

//////////////////set showText methode/////////////////////////////////

  String showText(int steps) {
    bool showSuffixIndicator = suffixIndicatorCheck(steps);
    bool showPrefixIndicator = steps.isOdd;

    String suffixIndicator =
        showSuffixIndicator ? typeWriterModel.indicatorShape : '';
    String prefixIndicator =
        showPrefixIndicator ? typeWriterModel.indicatorShape : '';
    return steps >= 0 && steps <= typeWriterModel.indicatorPulsesNum
        ? prefixIndicator
        : textValue(steps) + suffixIndicator;
  }

  bool suffixIndicatorCheck(int steps) {
    if (steps - typeWriterModel.indicatorPulsesNum <=
        typeWriterModel.text.length) {
      return true;
    } else if (steps - typeWriterModel.indicatorPulsesNum >=
            typeWriterModel.text.length &&
        steps.isOdd) {
      return true;
    }
    return false;
  }

  String textValue(int steps) {
    if (steps - typeWriterModel.indicatorPulsesNum <=
        typeWriterModel.text.length) {
      return typeWriterModel.text
          .substring(0, steps - typeWriterModel.indicatorPulsesNum);
    } else {
      return typeWriterModel.text.substring(0, typeWriterModel.text.length);
    }
  }

//////////////////set textPadding methode/////////////////////////////////

  EdgeInsets textPadding(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double textWidth =
        textSize(text: typeWriterModel.text, style: typeWriterModel.style)
            .width;
    return EdgeInsets.only(left: (screenWidth - textWidth) / 2);
  }

  Size textSize({required String text, required TextStyle? style}) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    return textPainter.size;
  }

/////////////////////////////////////////////////////////
}
