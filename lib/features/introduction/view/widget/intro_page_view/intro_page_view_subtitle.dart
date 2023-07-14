import 'package:flutter/cupertino.dart';
import 'package:keep_it/core/utils/app_paddings.dart';
import 'package:keep_it/core/utils/app_strings.dart';
import 'package:keep_it/core/utils/app_styles_text.dart';

class IntroPageViewSubtitle extends StatelessWidget {
  const IntroPageViewSubtitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.all30,
      child: Text(
        AppStrings.introSubtitle[0],
        style: AppTextStyles.textBold18,
        textAlign: TextAlign.center,
      ),
    );
  }
}
