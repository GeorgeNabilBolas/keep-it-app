import 'package:flutter/material.dart';
import 'package:keep_it/constants.dart';

abstract class Styles {
  static const labelSmall = TextStyle(
    color: kColor1,
    fontFamily: kFontFamily,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
  static const titleLarge = TextStyle(
    color: kColor1,
    fontFamily: kFontFamily,
    fontSize: 40,
    fontWeight: FontWeight.w900,
  );
  static const labelLarge = TextStyle(
    color: kColor1,
    fontFamily: kFontFamily,
    fontSize: 30,
    fontWeight: FontWeight.w800,
  );
  static const labelMedium = TextStyle(
    color: kColor1,
    fontFamily: kFontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w800,
  );
}
