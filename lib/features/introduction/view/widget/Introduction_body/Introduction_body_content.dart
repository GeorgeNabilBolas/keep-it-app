import 'package:flutter/cupertino.dart';
import 'package:keep_it/core/utils/styles/app_dimension.dart';
import 'package:keep_it/features/introduction/model/intro_model.dart';

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
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height / 2.2,
          width: size.width / 1.8,
          child: IntroductionBodyContentImage(image: introModel.image),
        ),
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
