import 'package:flutter/material.dart';

class TypewriterAnimatedText extends StatelessWidget {
  const TypewriterAnimatedText({
    super.key,
    required this.text,
    this.style,
    required this.indicatorShape,
    required this.indicatorPulsesNum,
    this.onEnd,
    required this.duration,
  });
  final String text;
  final TextStyle? style;
  final String indicatorShape;
  final int indicatorPulsesNum;
  final void Function()? onEnd;
  final Duration duration;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: duration,
      tween: StepTween(begin: 0, end: text.length + 2 * indicatorPulsesNum),
      builder: (context, steps, child) {
        return Padding(
          padding: textPadding(context),
          child: Text(
            showText(steps),
            style: style,
          ),
        );
      },
      onEnd: onEnd,
    );
  }

//////////////////set showText methode/////////////////////////////////

  String showText(int steps) {
    bool showSuffixIndicator = suffixIndicatorCheck(steps);
    bool showPrefixIndicator = steps.isOdd;

    String suffixIndicator = showSuffixIndicator ? indicatorShape : '';
    String prefixIndicator = showPrefixIndicator ? indicatorShape : '';
    return steps >= 0 && steps <= indicatorPulsesNum
        ? prefixIndicator
        : textValue(steps) + suffixIndicator;
  }

  bool suffixIndicatorCheck(int steps) {
    if (steps - indicatorPulsesNum <= text.length) {
      return true;
    } else if (steps - indicatorPulsesNum >= text.length && steps.isOdd) {
      return true;
    }
    return false;
  }

  String textValue(int steps) {
    if (steps - indicatorPulsesNum <= text.length) {
      return text.substring(0, steps - indicatorPulsesNum);
    } else {
      return text.substring(0, text.length);
    }
  }

//////////////////set textPadding methode/////////////////////////////////

  EdgeInsets textPadding(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double textWidth = textSize(text: text, style: style).width;
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
