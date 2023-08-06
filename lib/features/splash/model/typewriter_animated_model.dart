import 'package:flutter/material.dart';

class TypeWriterAnimatedModel {
  const TypeWriterAnimatedModel({
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
}
