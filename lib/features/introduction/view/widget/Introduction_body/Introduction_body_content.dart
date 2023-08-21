import 'package:flutter/material.dart';

import '../../../../../core/utils/styles/app_dimension.dart';
import '../../../model/intro_model.dart';
import 'Introduction_body_content_image.dart';
import 'Introduction_body_content_subtitle.dart';
import 'Introduction_body_content_title.dart';

class IntroductionBodyContent extends StatelessWidget {
  const IntroductionBodyContent({
    super.key,
    required this.introModel,
  });
  final IntroModel introModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntroductionBodyContentImage(image: introModel.image),
        const SizedBox(height: AppDimension.introImageAndTitleSpacing),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IntroductionBodyContentTitle(title: introModel.title),
            IntroductionBodyContentSubtitle(subtitle: introModel.subtitle),
          ],
        ),
      ],
    );
  }
}
