import 'package:flutter/material.dart';

class AppPaddings {
  static const EdgeInsets introTitle =
      EdgeInsets.symmetric(horizontal: 12, vertical: 4);

  static const EdgeInsets introSubtitle =
      EdgeInsets.symmetric(horizontal: 40.0, vertical: 8);
  static const EdgeInsets introButtonsSpacing =
      EdgeInsets.symmetric(vertical: 8);
  static const EdgeInsets introIndicatroSpacing =
      EdgeInsets.symmetric(horizontal: 8);

  ///buttons
  static const introNextButton = EdgeInsets.only(
    left: 15,
    top: 5,
    right: 25,
    bottom: 5,
  );
  static const introSkipButton = EdgeInsets.only(
    left: 25,
    top: 5,
    right: 15,
    bottom: 5,
  );
  static const introGoButton = EdgeInsets.symmetric(
    horizontal: 25,
    vertical: 5,
  );
  static const homePageContentSpacing = EdgeInsets.all(8);
  static const homeListTileContentPadding =
      EdgeInsets.symmetric(vertical: 10, horizontal: 20);
  static const homeDialogMargin = EdgeInsets.only(top: 30, left: 25, right: 25);
}
